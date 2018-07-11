import _ from 'lodash';
import convict from 'webpack-convict';

import * as Initializers from './initializers';

// Change this to your app name
const ENV_VAR_PREFIX = 'CHOONS_FRONTEND';

function setEnv(envVar) {
  return `${ENV_VAR_PREFIX}_${envVar}`;
}

const config = convict({
  env: {
    doc: 'The application environment',
    format: [
      'dev',
    ],
    default: 'dev',
    env: setEnv('ENV'),
  },

  version: {
    doc: 'Application version',
    format: String,
    default: require('../../package.json').version, // eslint-disable-line global-require
  },

  log: {
    name: {
      doc: 'Log name',
      format: String,
      default: 'application-logger',
      env: setEnv('LOG_NAME'),
    },

    level: {
      doc: 'Bunyan log level (name or number)',
      format: (val) => {
        if (typeof val !== 'string' && typeof val !== 'number') {
          throw new TypeError('Log level must be a string of a number');
        }
      },
      default: 'info',
      env: setEnv('LOG_LEVEL'),
    },

    stream: {
      doc: 'Bunyan stream type',
      format: String,
      default: 'ConsoleFormattedStream',
      env: setEnv('LOG_STREAM'),
    }
  },

  server: {
    host: {
      doc: 'Server hostname',
      format: String,
      default: 'localhost',
      env: setEnv('HOSTNAME'),
    },

    port: {
      doc: 'Port server is listening on',
      format: Number,
      default: 3000,
      env: setEnv('PORT'),
    },
  },

  api: {
    url: {
      doc: 'API URL for the backend',
      format: String,
      default: 'http://localhost:8080',
      env: setEnv('API_URL'),
    },
  },
});

const env = config.get('env');
const envConfig = require(`json-loader!./env/${env}.json`);

config.load(envConfig);
config.validate();

// Run any initializers
_.forEach(Initializers, (initialize) => {
  initialize(config);
});

export default config;
