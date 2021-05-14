import 'package:flutter/material.dart';
import 'package:shop_app/models/CartItem.dart';

class Order {
  final String id;
  final List<CartItem> products;
  final DateTime dateTime;
  final double amount;

  Order({
    @required this.id,
    @required this.products,
    @required this.dateTime,
    @required this.amount,
  });
}
