import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String productId;
  final double price;
  final int qty;

  CartItem({
    @required this.id,
    @required this.productId,
    @required this.price,
    @required this.qty,
  });
}
