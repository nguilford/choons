import Boom from 'boom';

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
