export default function (connection, dataTypes) {
  const User = connection.define(
    'User',
    {
      userName: {
        field: 'user_name',
        type: dataTypes.STRING,
        unique: 'userNameRef',
      },
      firstName: {
        field: 'first_name',
        type: dataTypes.STRING,
      },
      lastName: {
        field: 'last_name',
        type: dataTypes.STRING,
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
      tableName: 'user',
      classMethods: {
        associate: function associate(models) {
          User.hasMany(models.UserSong, {
            foreignKey: 'userId',
            onDelete: 'CASCADE',
          });
        },
      },
    },
  );

  return User;
}
