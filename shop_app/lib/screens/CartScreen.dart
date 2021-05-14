import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/providers/Cart.dart';
import 'package:shop_app/providers/Orders.dart';
import 'package:shop_app/providers/Products.dart';
import 'package:shop_app/screens/HomeScreen.dart';
import 'package:shop_app/utils/Utils.dart';
import 'package:shop_app/widgets/CartListItem.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart-screen';

  const CartScreen({Key key}) : super(key: key);

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
              'product': i.value.product,
              'qty': i.value.qty,
            })
        .toList();

    final total = Provider.of<Cart>(context).totalAmount.toInt();

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (ctx, i) {
              final product = cartItems[i]['product'] as Product;
              var qty = cartItems[i]['qty'] as int;

              return CartListItem(product: product, qty: qty);

              // return _buildCartItem(
              //   product,
              //   discountedPrice,
              //   price,
              //   qty,
              //   context,
              // );
            },
          ),
        ),
        _buildBottomTotal(context, total),
      ],
    );
  }

  // Widget _buildCartItem(Product product, int discountedPrice, double price,
  //     int qty, BuildContext context) {
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: Container(
  //       padding: const EdgeInsets.all(8),
  //       decoration: BoxDecoration(
  //         color: Colors.grey.withOpacity(0.1),
  //       ),
  //       child: Column(
  //         children: [
  //           ListTile(
  //             title: Text(product.title),
  //             subtitle: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 SizedBox(height: 10),
  //                 Row(
  //                   children: [
  //                     _buildRatingBadge(product.rating),
  //                   ],
  //                 ),
  //                 SizedBox(height: 10),
  //                 Row(
  //                   children: [
  //                     Text(
  //                       '₹' + discountedPrice.toString(),
  //                       style: TextStyle(
  //                         fontSize: 18,
  //                         color: Colors.black,
  //                       ),
  //                     ),
  //                     SizedBox(width: 5),
  //                     Text(
  //                       '₹' + price.toString(),
  //                       style: TextStyle(
  //                         decoration: TextDecoration.lineThrough,
  //                         fontSize: 16,
  //                       ),
  //                     ),
  //                     SizedBox(width: 10),
  //                     Text(
  //                       '${product.discount}% off',
  //                       style: TextStyle(
  //                         fontSize: 16,
  //                         color: Colors.green,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 SizedBox(height: 10),
  //                 Text(
  //                   'Quantity: $qty',
  //                   style: TextStyle(
  //                     fontSize: 16,
  //                   ),
  //                 ),
  //                 SizedBox(height: 10),
  //                 Row(
  //                   children: [
  //                     Container(
  //                       width: 50,
  //                       child: OutlinedButton(
  //                         style: OutlinedButton.styleFrom(
  //                           primary: Colors.white,
  //                           side: BorderSide(
  //                             color: Colors.black,
  //                           ),
  //                         ),
  //                         child: Icon(
  //                           Icons.add,
  //                           color: Colors.black,
  //                           size: 18,
  //                         ),
  //                         onPressed: () {
  //                           Provider.of<Cart>(context, listen: false).addItem(
  //                             product: product,
  //                             qty: 1,
  //                           );

  //                           setState(() {});
  //                         },
  //                       ),
  //                     ),
  //                     SizedBox(width: 5),
  //                     Container(
  //                       width: 50,
  //                       child: OutlinedButton(
  //                         style: OutlinedButton.styleFrom(
  //                           primary: Colors.white,
  //                           side: BorderSide(
  //                             color: Colors.black,
  //                           ),
  //                         ),
  //                         child: Icon(
  //                           Icons.remove,
  //                           color: Colors.black,
  //                           size: 18,
  //                         ),
  //                         onPressed: () {
  //                           Provider.of<Cart>(context, listen: false)
  //                               .removeSingleItem(product.id);

  //                           setState(() {});
  //                         },
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //             trailing: Image.network(
  //               product.imageUrl[0],
  //               fit: BoxFit.cover,
  //             ),
  //           ),
  //           Divider(),
  //           Container(
  //             width: double.infinity,
  //             child: TextButton.icon(
  //               icon: Icon(Icons.delete),
  //               label: Text('Remove'),
  //               onPressed: () {
  //                 Provider.of<Cart>(context, listen: false)
  //                     .removeItem(product.id);

  //                 setState(() {});
  //               },
  //               style: ButtonStyle(
  //                 overlayColor:
  //                     MaterialStateProperty.all(Colors.black.withOpacity(0.1)),
  //                 elevation: MaterialStateProperty.all(0),
  //                 foregroundColor: MaterialStateProperty.all(Colors.black45),
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _buildBottomTotal(BuildContext context, int total) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          SizedBox(width: 10),
          Expanded(
            child: Container(
              width: double.infinity,
              child: Text(
                '₹$total',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            width: 150,
            child: ElevatedButton(
              child: Text(
                'Place Order',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              onPressed: () {
                final cartItems = Provider.of<Cart>(context, listen: false)
                    .items
                    .values
                    .toList();
                final cartTotal =
                    Provider.of<Cart>(context, listen: false).totalAmount;
                Provider.of<Orders>(context, listen: false)
                    .addOrder(cartItems, cartTotal);

                cartItems.forEach((item) {
                  Provider.of<Products>(context, listen: false)
                      .decreaseQuantity(item.product.id, item.qty);
                });

                Provider.of<Cart>(context, listen: false).clear();
                Utils.showSnackBar(
                    context, Text('Your order has been placed.'));
              },
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildRatingBadge(double rating) {
  //   Color badgeColor = rating >= 3.5
  //       ? Colors.green
  //       : rating >= 2.0
  //           ? Colors.amber[700]
  //           : Colors.red;

  //   return Container(
  //     padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
  //     width: 45,
  //     decoration: BoxDecoration(
  //       color: badgeColor,
  //       borderRadius: BorderRadius.circular(10),
  //     ),
  //     child: Row(
  //       children: [
  //         Text(
  //           rating.toString() + " ",
  //           style: TextStyle(color: Colors.white),
  //         ),
  //         Icon(
  //           Icons.star,
  //           color: Colors.white,
  //           size: 12,
  //         ),
  //       ],
  //     ),
  //   );
  // }

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
