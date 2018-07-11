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
