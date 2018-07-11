import Boom from 'boom';

import BaseController from '../base';
import Models from '../../models';

export default class UserSongsController extends BaseController {
  list(request, reply) {
    return Models.User.findById(request.params.userId)
      .then((user) => {
        if (!user) {
          throw Boom.notFound('No such user');
        }

        return user.getUserSongs({
          include: [
            {
              model: Models.Song,
              attributes: {
                exclude: ['createdAt', 'updatedAt'],
              },
            },
          ],
        });
      })
      .map(this.format)
      .then(reply)
  }

  create(request, reply) {
    return Models.UserSong.create({
      songId: request.payload.songId,
      userId: request.params.userId,
    })
      .then((userSong) => {
        return Models.UserSong.find({
          where: {
            id: userSong.id,
          },
          include: [
            {
              model: Models.Song,
              attributes: {
                exclude: ['createdAt', 'updatedAt'],
              },
            },
          ],
        });
      })
      .then(this.format)
      .then(reply)
      .catch((error) => {
        if (error.name === 'SequelizeForeignKeyConstraintError') {
          throw Boom.notFound('No such user or song');
        }

        if (error.name === 'SequelizeUniqueConstraintError') {
          throw Boom.badRequest('Song already exists for user');
        }

        throw error;
      });
  }

  format(instance) {
    const song = super.format(instance).Song;

    song.rating = instance.rating;
    song.plays = instance.plays;
    song.songId = song.id;
    song.userId = instance.userId;
    delete song.id;

    return song;
  }
}
