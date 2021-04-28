import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/providers/Cart.dart';
import 'package:shop_app/providers/Products.dart';
import 'package:shop_app/screens/HomeScreen.dart';
import 'package:shop_app/widgets/ProductRating.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart-screen';

  const CartScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemCount = Provider.of<Cart>(context).itemCount;
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 40,
          child: Image.asset('assets/images/myShopLogo.png'),
        ),
        centerTitle: true,
        brightness: Brightness.dark,
      ),
      body: itemCount > 0 ? _buildCart(context) : _buildEmptyCart(context),
    );
  }

  Widget _buildCart(BuildContext context) {
    final cartItems = Provider.of<Cart>(context)
        .items
        .entries
        .map((i) => {
              'product': Provider.of<Products>(context).findById(i.key),
              'qty': i.value.qty,
              'price': i.value.price,
            })
        .toList();

    return ListView.builder(
      itemCount: cartItems.length,
      itemBuilder: (ctx, i) {
        final product = cartItems[i]['product'] as Product;
        final qty = cartItems[i]['qty'] as int;
        final price = cartItems[i]['price'] as double;
        final discountedPrice =
            (price - (price * product.discount / 100)).toInt();

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(product.title),
            subtitle: Column(
              children: [
                SizedBox(height: 10),
                Row(
                  children: [
                    _buildRatingBadge(product.rating),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      '₹' + discountedPrice.toString(),
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      '₹' + price.toString(),
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      '${product.discount}% off',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            trailing: Image.network(
              product.imageUrl[0],
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }

  Widget _buildRatingBadge(double rating) {
    Color badgeColor = rating >= 3.5
        ? Colors.green
        : rating >= 2.0
            ? Colors.amber[700]
            : Colors.red;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
      width: 45,
      decoration: BoxDecoration(
        color: badgeColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Text(
            rating.toString() + " ",
            style: TextStyle(color: Colors.white),
          ),
          Icon(
            Icons.star,
            color: Colors.white,
            size: 12,
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyCart(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Icon(
              Icons.dashboard_outlined,
              size: 100,
              color: Theme.of(context).primaryColor.withOpacity(0.6),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Your cart is empty!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Text(
            'Add items to it now.',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 14,
            ),
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
          ),
        ],
      ),
    );
  }
}
