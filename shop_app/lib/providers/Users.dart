import 'package:flutter/material.dart';

import '../models/User.dart';

class Users with ChangeNotifier {
  static List<User> _users = [
    User(
      email: 'test1@test.com',
      password: 'testtest1',
      username: 'test1',
      name: 'Test User 1',
    ),
    User(
      email: 'test2@test.com',
      password: 'testtest2',
      username: 'test2',
      name: 'Test User 2',
    ),
    User(
      email: 'test3@test.com',
      password: 'testtest3',
      username: 'test3',
      name: 'Test User 3',
    ),
  ];

  static User addUser(String email, String password, String name) {
    final user = User(
      name: name,
      email: email,
      password: password,
      username: email.substring(0, email.indexOf('@')),
    );

    _users.add(user);
    return user;
  }

  static User find(String username, String email, String password) {
    return _users.firstWhere((user) =>
        ((user.username == username) || (user.email == email)) &&
        (user.password == password));
  }

  static User findUser(String username, String email) {
    return _users
        .firstWhere((u) => (u.username == username) || (u.email == email));
  }
}
