import Boom from 'boom';

import BaseController from './base';
import Models from '../models';

export default class SongsController extends BaseController {
  list(request, reply) {
    return Models.Song.findAll()
      .map(this.format)
      .then(reply);
  }

  read(request, reply) {
    return Models.Song.findById(request.params.songId)
      .then((song) => {
        if (!song) {
          throw Boom.notFound('No such song');
        }

        return song;
      })
      .then(this.format)
      .then(reply);
  }

  create(request, reply) {
    return Models.Song.create({
      title: request.payload.title,
      trackNumber: request.payload.trackNumber,
      artist: request.payload.artist,
      album: request.payload.album,
      year: request.payload.year,
    })
      .then(this.format)
      .then(reply)
  }
}
