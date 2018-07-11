import SongsController from '../controllers/songs';

function endpoints(config) {
  const song = new SongsController(config);

  return [
    {
      method: 'GET',
      path: '/songs',
      handler: song.list.bind(song),
    },

    {
      method: 'GET',
      path: '/songs/{songId}',
      handler: song.read.bind(song),
    },

    {
      method: 'POST',
      path: '/songs',
      handler: song.create.bind(song),
    },
  ];
}

export default endpoints;
