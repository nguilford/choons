// eslint-disable-next-line no-unused-vars
import Sequelize from 'sequelize';

// eslint-disable-next-line no-unused-vars
export default function initialize(config) {
  const options = {
    dialect: config.get('database.dialect'),
    host: config.get('database.host'),
    port: config.get('database.port'),
    storage: config.get('database.storage'),
    define: {
      freezeTableName: true,
    },
  };

  const connection = new Sequelize(
    config.get('database.name'),
    config.get('database.user'),
    config.get('database.password'),
    options,
  );

  config.set('database.connection', connection);
}
