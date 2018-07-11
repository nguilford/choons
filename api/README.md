Choons API
=========

The API servicing the Choons web app. Built using [Hapi](https://hapijs.com/) and [Sequelize](http://docs.sequelizejs.com/).

## Dependencies

- Node v6+
- npm (tested with 5.3.0) or yarn (tested with 1.3.2)
- SQL database such as mysql or sqlite

If you are building via docker (see `choons/build`), these dependencies are all handled for you. See docker dependencies in `choons/README.md`

## To Run:

```bash
$ npm start
```

Transpiles all es6 code to plain javascript and then starts a local instance of the server listening at `localhost:8080`.

## Endpoints

#### POST /users
Create a new user.

Request payload:  

|Field|Type|Description|
|-----|----|-----------|
|userName|String|Unique username.|
|firstName|String|User's first name|
|lastName|String|User's last name|

#### GET /users
Retrieve the list of all users.

#### GET /users/:id
Retrieve data for a user given by `id`.

#### POST /songs
Creates a new song in the master list of songs.

Request payload:  

|Field|Type|Description|
|-----|----|-----------|
|title|String|Song title|
|trackNumber|Integer|Track number on album|
|artist|String|Artist name|
|album|String|Album name|
|year|Integer|Year song was released|

#### GET /songs
Retrieve the list of all songs.

#### GET /songs/:id
Retrieve data for a single song given by `id`.

#### POST /users/:id/songs
Add an existing song from the master list of songs to an existing user given by `id`.

Request payload:

|Field|Type|Description|
|-----|----|-----------|
|songId|Integer|Unique song id|

## Development

#### Routes

All API routes are defined in `api/src/routes`. Each set of endpoints should be defined in their own `route` module. Every `route` module must export a default function that returns an array of endpoint objects defined as [Hapi routes](https://hapijs.com/api#serverrouteoptions). This function will be passed a `config` object defining the app's configuration for use by the handler if needed. New route files will have their endpoints registered automatically when the app starts. Registration is recursive, so you may organize your route files in any number of subfolders inside of `api/src/routes`. Hidden-files, index.js files and non-js files are ignored.

The handlers are methods belonging to an instance of the route's Controller class, which must be instantiated with the `config` object before returning the array of endpoints. Because the handler methods in Controller objects are expected to be Hapi route handlers, they must accept `request` and `reply` arguments in their function signatures, and each method must ultimately either return a call to `reply` or throw an error.

All controllers are defined in `api/src/controllers` and exist as a 1:1 mapping of `route` modules in `api/src/routes`.

**Example**

For our collection of `users` endpoints, we have implemented the following `route` and `controller` modules.

**api/src/routes/users.js**
```javascript
import UsersController from '../controllers/users';

function endpoints(config) {
  const user = new UsersController(config);

  return [
    {
      method: 'GET',
      path: '/users',
      handler: user.list.bind(user),
    },

    {
      method: 'GET',
      path: '/users/{userId}',
      handler: user.read.bind(user),
    },

    {
      method: 'POST',
      path: '/users',
      handler: user.create.bind(user),
    },
  ];
}

export default endpoints;
```

**api/src/controllers/users.js**
```javascript
import BaseController from './base';
import Models from '../models';

export default class UsersController extends BaseController {
  list(request, reply) {
    return Models.User.findAll()
      .map(this.format)
      .then(reply);
  }

  read(request, reply) {
    return Models.User.findById(request.params.userId)
      .then((user) => {
        if (!user) {
          throw Boom.notFound('No such user');
        }   

        return user;
      })
      .then(this.format)
      .then(reply);
  }

  create(request, reply) {
    return Models.User.create({
      userName: request.payload.userName,
      firstName: request.payload.firstName,
      lastName: request.payload.lastName,
    })
      .then(this.format)
      .then(reply)
      .catch((error) => {
        if (error.name === 'SequelizeUniqueConstraintError') {
          throw Boom.badRequest('userName already taken');
        }   

        throw error;
      }); 
  }
}
```

**NOTE**: [Handlers MUST NOT be implemented using fat-arrow style](https://hapijs.com/api#route-handler), lest you make Hapi sad.

#### Models

The API's models are defined as [Sequelize](http://docs.sequelizejs.com/) objects in `api/src/models`. Much like the `routes` modules, the `models` modules are also automatically loaded and initialized. Associations with other models are to be created via an `associate` function in the `classMethods` array. Other initialization is to be defined in an `initialize` function also in the `classMethods` array. These functions will be called automatically for you and, in the case of `initialize`, will be passed the app's `config` object, should the model require it. Once initialized, all model instances will be available inside of the `Models` object exported by `api/src/models/index.js`, and will be keyed off the name of the particular model as defined with Sequelize.

**Example**  

Notice that the `User` model is accessed in the above controller by importing `Model` from `api/src/models` and then accessing `Models.User`. The model definition itself is as follows:

**api/src/models/user.js**
```javascript
export default function (connection, dataTypes) {
  const User = connection.define(
    'User',
    {
      userName: {
        field: 'user_name',
        type: dataTypes.STRING,
        unique: 'userNameRef',
      },
      firstName: {
        field: 'first_name',
        type: dataTypes.STRING,
      },
      lastName: {
        field: 'last_name',
        type: dataTypes.STRING,
      },
      createdAt: {
        field: 'created_at',
        type: dataTypes.DATE,
      },
      updatedAt: {
        field: 'updated_at',
        type: dataTypes.DATE,
      },
    },
    {
      tableName: 'user',
      classMethods: {
        associate: function associate(models) {
          User.hasMany(models.UserSong, {
            foreignKey: 'userId',
            onDelete: 'CASCADE',
          });
        }

        /* Handle any initialization
        initialize: function initialize(config) {
        }
        */
      },
    },
  );

  return User;
}
```


## Singletons

When the app starts, it initializes the following singletons when loading its configuration:

- `Bunyan.defaultLogger`: Logger instance (see `src/config/initializers/logger.js`)

Available by importing `Bunyan`.

- `Config.database.defaultConnection`: Database connection instance (see `src/initializers/database.js`)

Available in the app's `Config` object.

## Available Environment Variables

- `CHOONS_API_ENV`: Application environment
- `CHOONS_API_LOG_NAME`: Name of the Bunyan default logger
- `CHOONS_API_LOG_LEVEL`: Log level for the Bunyan logger
- `CHOONS_API_HOSTNAME`: Hostname or ip address the server will listen at
- `CHOONS_API_PORT`: Port number the server will listen on
- `CHOONS_API_DATABASE_DIALECT`: Database dialect Sequlize will use when connecting to the database
- `CHOONS_API_DATABASE_STORAGE`: Storage type Sequelize will use if database dialect is sqlite
- `CHOONS_API_DATABASE_HOST`: Hostname or ip address of the database
- `CHOONS_API_DATABASE_PORT`: Port the database listens on
- `CHOONS_API_DATABASE_USER`: User name of the database account
- `CHOONS_API_DATABASE_PASSWORD`: Password for the database account
- `CHOONS_API_DATABASE_NAME`: Name of the database
