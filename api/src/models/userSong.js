/* An example Sequelize model; modify as you see fit */

export default function (connection, dataTypes) {
  const UserSong = connection.define(
    'UserSong',
    {
      userId: {
        field: 'user_id',
        type: dataTypes.INTEGER,
        unique: 'userIDSongIDRef',
      },
      songId: {
        field: 'song_id',
        type: dataTypes.INTEGER,
        unique: 'userIDSongIDRef',
      },
      rating: {
        field: 'rating',
        type: dataTypes.INTEGER,
      },
      plays: {
        field: 'plays',
        type: dataTypes.INTEGER,
      },
      createdAt: {
        field: 'created_at',
        type: dataTypes.DATE,
      },
      updatedAt: {
        field: 'updated_at',
        type: dataTypes.DATE,
      },
    },
    {
      tableName: 'user_song',
      classMethods: {
        associate: function associate(models) {
          UserSong.belongsTo(models.Song, {
            foreignKey: 'songId',
            onDelete: 'CASCADE',
          });

          UserSong.belongsTo(models.User, {
            foreignKey: 'userId',
            onDelete: 'CASCADE',
          });
        },
      },
    },
  );

  return UserSong;
}
