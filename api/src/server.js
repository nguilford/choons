import Bunyan from 'bunyan';
import Hapi from 'hapi';
import Bluebird from 'bluebird';

import Routes from './routes';

const SERVER = Symbol('SERVER');
const PLUGINS = [
  'hapi-cors',
];

function setupServer(config) {
  const server = new Hapi.Server({
    debug: {
      request: ['error'],
    },
  });

  server.connection({
    host: config.get('server.host'),
    port: config.get('server.port'),
  });

  Routes.register(server, config);

  return server;
}


export default class Server {
  constructor(config) {
    this[SERVER] = setupServer(config);
  }

  get server() {
    return this[SERVER];
  }

  start() {
    Bluebird.each(PLUGINS, (plugin) => {
      return this.server.register({
        register: require(plugin), //eslint-disable-line
      });
    })
      .then(() => {
        this.server.start();
      })
      .then(() => {
        Bunyan.defaultLogger.info(`Server listening at ${this.server.info.uri}`);
      })
      .catch((error) => {
        Bunyan.defaultLogger.error(`Failed to start server: ${error}`);
        throw error;
      });
  }

  stop() {
    return this.server.stop()
      .then(() => {
        Bunyan.defaultLogger.info('Server stopped');
      })
      .catch((error) => {
        Bunyan.defaultLogger.error(`Failed to stop server cleanly: ${error}`);
        throw error;
      });
  }
}
