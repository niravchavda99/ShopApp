import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/models/User.dart';
import 'package:shop_app/providers/Users.dart';

class Auth with ChangeNotifier {
  String _token;
  String _username;
  String _email;

  bool get isAuth {
    return _token != null;
  }

  String get token {
    return _token;
  }

  String get username {
    return _username;
  }

  String get email {
    return _email;
  }

  User get user {
    Users.findUser(username, email);
  }

  Future<void> _authenticate(
      String username, String email, String password) async {
    User user = Users.find(username, email, password);
    try {
      if (user != null) {
        _token = user.username + user.email;
        _username = user.username;
        _email = user.email;

        notifyListeners();

        final prefs = await SharedPreferences.getInstance();
        final userData = json.encode({
          'token': _token,
          'username': _username,
          'email': _email,
        });

        prefs.setString('myShopUserData', userData);
        print(_token);
        print(_username);
        print(_email);
      }
    } catch (error) {
      throw error;
    }
  }

  Future<void> signup(String username, String email, String password) async {
    User user = Users.addUser(email, password);
    return _authenticate(user.username, user.email, user.password);
  }

  Future<void> login(String username, String email, String password) async {
    return _authenticate(username, email, password);
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();

    if (!prefs.containsKey('myShopUserData')) return false;

    final extractedUserData =
        json.decode(prefs.getString('myShopUserData')) as Map<String, Object>;

    _token = extractedUserData['token'];
    _username = extractedUserData['username'];
    _email = extractedUserData['email'];
    notifyListeners();
    return true;
  }

  void logout() async {
    _token = null;
    _username = null;
    _email = null;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
