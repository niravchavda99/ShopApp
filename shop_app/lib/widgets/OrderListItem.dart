import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/models/Order.dart';

class OrderListItem extends StatefulWidget {
  OrderListItem({Key key, this.order}) : super(key: key);

  final Order order;

  @override
  _OrderListItemState createState() => _OrderListItemState();
}

class _OrderListItemState extends State<OrderListItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order - ${DateFormat.yMMMMd().format(widget.order.dateTime)}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  '₹${widget.order.amount}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            if (_isExpanded)
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: widget.order.products
                    .map<Widget>(
                      (p) => Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${p.product.title} x${p.qty}',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text('Discount: ${p.product.discount}%'),
                                    Text('₹${p.product.price.toInt()}'),
                                    Text(
                                        '- ₹${p.product.discountGiven.toInt()}'),
                                    SizedBox(height: 5),
                                    Text(
                                      '₹${p.product.discountedPrice.toInt()}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('x ${p.qty}'),
                                    SizedBox(height: 5),
                                    Text(
                                      '₹${p.product.discountedPrice.toInt() * p.qty}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                        ],
                      ),
                    )
                    .toList()
                      ..add(Text(
                        'Total: ₹${widget.order.amount}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      )),
              ),
            if (_isExpanded) SizedBox(height: 10),
            _buildArrow()
          ],
        ),
      ),
    );
  }

  Widget _buildArrow() {
    return InkWell(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
      ),
    );
  }
}
