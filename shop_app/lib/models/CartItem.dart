import 'package:flutter/material.dart';

import 'Product.dart';

class CartItem {
  final Product product;
  final int qty;

  CartItem({
    @required this.product,
    @required this.qty,
  });
}
