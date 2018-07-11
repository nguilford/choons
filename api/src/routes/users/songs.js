import UserSongsController from '../../controllers/users/songs';

function endpoints(config) {
  const controller = new UserSongsController(config);

  return [
    {
      method: 'GET',
      path: '/users/{userId}/songs',
      handler: controller.list.bind(controller),
    },

    {
      method: 'POST',
      path: '/users/{userId}/songs',
      handler: controller.create.bind(controller),
    },
  ];
}

export default endpoints;
