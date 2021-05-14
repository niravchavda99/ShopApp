import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/Order.dart';
import 'package:shop_app/providers/Orders.dart';
import 'package:shop_app/widgets/OrderListItem.dart';

import 'HomeScreen.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders-screen';

  const OrdersScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context).orders;

    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 40,
          child: Image.asset('assets/images/myShopLogo.png'),
        ),
        centerTitle: true,
        brightness: Brightness.dark,
      ),
      body: orders.length > 0
          ? _buildOrders(context, orders)
          : _buildEmptyOrders(context),
    );
  }
}

Widget _buildEmptyOrders(BuildContext context) {
  return Center(
    child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'No transactions found yet.',
            style: TextStyle(fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              child: Text('Shop now'),
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(HomeScreen.routeName);
              },
            ),
          )
        ],
      ),
    ),
  );
}

Widget _buildOrders(BuildContext context, List<Order> orders) {
  return ListView.builder(
    itemCount: orders.length,
    itemBuilder: (ctx, i) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: OrderListItem(
        order: orders[i],
      ),
    ),
  );
}
