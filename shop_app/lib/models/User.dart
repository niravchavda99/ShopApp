import 'package:flutter/material.dart';

class User {
  final String username;
  final String email;
  final String password;
  final String name;

  User({
    @required this.username,
    @required this.email,
    @required this.password,
    @required this.name,
  });
}
