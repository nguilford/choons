export default class BaseController {
  constructor(config) {
    this.config = config;
  }

  // Returns a JSONified representation of a Sequelize db object instance
  // eslint-disable-next-line class-methods-use-this
  format(instance) {
    const record = instance.toJSON();

    if (record.createdAt) {
      record.createdAt = record.createdAt.toISOString();
    }

    if (record.updatedAt) {
      record.updatedAt = record.updatedAt.toISOString();
    }

    return record;
  }
}
