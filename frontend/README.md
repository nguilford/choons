Choons Front End
=========

The front end of the Choons web app. Built using [React](https://reactjs.org/) and [Webpack](https://webpack.github.io/)

## Dependencies

- Node v6+
- npm (tested with 5.3.0) or yarn (tested with 1.3.2)
- Choons Backend API server

If you are building via docker (see `choons/build`), these dependencies are all handled for you. Refer to dependencies in `choons/README.md`

## To Run:

```bash
$ npm start
```

Webpack handles es6 transpiling and module loading, and react-scripts starts an instance of the server listening at localhost:3000. It will try to talk to the backend API at localhost:8080 by default. You must bring up a backend API server for the front end to talk to or it will not be able to fetch data to render in your browser. You can do this either by running with docker-compose (refer to `/choons/README.md`) or by bringing up an instance of the API via node (refer to `choons/api/README.md`).

## To Use

Click on any column header to sort by that column. You may also type into the search box to filter by song title, artist, and album. Sorts respect the filter and vice versa.

## Available Environment Variables

- `CHOONS_FRONTEND_ENV`: Application environment
- `CHOONS_FRONTEND_LOG_NAME`: Name of the Bunyan default logger
- `CHOONS_FRONTEND_LOG_LEVEL`: Log level for the Bunyan logger
- `CHOONS_FRONTEND_LOG_STREAM`: Type of Bunyan log stream to use
- `CHOONS_FRONTEND_HOSTNAME`: Hostname or ip address the server will listen at
- `CHOONS_FRONTEND_PORT`: Port number the server will listen on
- `CHOONS_FRONTEND_API_URL`: API URL for the backend
