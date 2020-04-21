import 'models/user.dart';

class UserHolder{
  Map<String, User> users = {};

  User registerUser(String name, String phone, String email){
    User user = User(
      name: name,
      phone: phone,
      email: email
    );

    if (!users.containsKey(user.login)){
      // users.addAll({w

      users[user.login] = user;

    }else{
      throw Exception("User with this name already exists");
    }

    return user;
  }

  User getUserByLogin(String login){
    return users[login];
  }

  User registerUserByEmail(String fullName, String email){
    User user = User(
      name: fullName,
      email: email
    );

    if (!users.containsKey(user.login))
      users[user.login] = user;
    else
      throw Exception("A user with this email already exists");

    return user;
  }

  User registerUserByPhone(String fullName, String phone){
    User user = User(
      name: fullName,
      phone: phone
    );

    if (!users.containsKey(user.login))
      users[user.login] = user;
    else
      throw Exception("A user with this phone already exists");

    return user;
  }

  void setFriends(String userLogin, List<User> userFriends){
    users[userLogin].friends = userFriends;
  }

  User findUserInFriends(String userLogin, User user){
    if (users[userLogin].friends.contains(user))
      return user;
    else
      throw Exception("${user.login} is not a friend of the login");
  }

  List<User> importUsers(List<String> csv){
    List<User> usersList = [];

    csv.forEach((String item){
      List<String> strings = item.split(";");

      usersList.add(
        User(
          name: strings[0].trim(),
          email: strings[1].trim(),
          phone: strings[2].trim()
        )
      );
    });

    return usersList;
  }
}