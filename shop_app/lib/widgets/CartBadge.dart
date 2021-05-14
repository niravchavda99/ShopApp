import 'package:flutter/material.dart';
import 'package:shop_app/screens/CartScreen.dart';

class CartBadge extends StatelessWidget {
  const CartBadge({Key key, this.count}) : super(key: key);

  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: Stack(
        children: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).pushNamed(CartScreen.routeName);
            },
          ),
          Positioned(
            right: 5,
            top: 3,
            child: Container(
              padding: const EdgeInsets.all(4),
              width: 18,
              height: 18,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text(
                count.toString(),
                style: TextStyle(
                    color: Colors.black, fontSize: (count > 9 ? 10 : 12)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
