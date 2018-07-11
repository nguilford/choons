export default function (connection, dataTypes) {
  const Song = connection.define(
    'Song',
    {
      title: {
        field: 'title',
        type: dataTypes.STRING,
      },
      trackNumber: {
        field: 'track_number',
        type: dataTypes.INTEGER,
      },
      artist: {
        field: 'artist',
        type: dataTypes.STRING,
      },
      album: {
        field: 'album',
        type: dataTypes.STRING,
      },
      year: {
        field: 'year',
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
      tableName: 'song',
      classMethods: {
        associate: function associate(models) {
          Song.hasMany(models.UserSong, {
            foreignKey: 'songId',
            onDelete: 'CASCADE',
          });
        },
      },
    },
  );

  return Song;
}
