import Bunyan from 'browser-bunyan';

// Initializes a logger singleton, accessible in Bunyan.defaultLogger
export default function initialize(config) {
  const options = config.get('log');
  const re = /^[0-9]+$/;

  // We must convert any numeric strings to numbers, or Bunyan will choke
  if (typeof options.level === 'string' && options.level.match(re)) {
    options.level = Number(options.level);
  }

  options.stream = new Bunyan[options.stream]();

  Bunyan.defaultLogger = Bunyan.createLogger(options);
}
