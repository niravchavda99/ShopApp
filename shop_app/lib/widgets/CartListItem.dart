import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/providers/Cart.dart';
import 'package:shop_app/screens/ProductDetailScreen.dart';
import 'package:shop_app/utils/Utils.dart';

class CartListItem extends StatefulWidget {
  CartListItem({Key key, this.product, this.qty}) : super(key: key);

  final Product product;
  final int qty;

  @override
  _CartListItemState createState() => _CartListItemState();
}

class _CartListItemState extends State<CartListItem> {
  Product product;
  int qty;

  @override
  void initState() {
    super.initState();
    qty = widget.qty;
    product = widget.product;
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
        ),
        child: Column(
          children: [
            ListTile(
              title: Text(product.title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                        '₹' + product.discountedPrice.toInt().toString(),
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        '₹' + product.price.toString(),
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
                  SizedBox(height: 10),
                  Text(
                    'Quantity: $qty',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        width: 50,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            primary: Colors.white,
                            side: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.black,
                            size: 18,
                          ),
                          onPressed: () {
                            if (qty < product.numberInStock) {
                              Provider.of<Cart>(context, listen: false).addItem(
                                product: product,
                                qty: 1,
                              );

                              setState(() {
                                qty = qty + 1;
                              });
                            } else
                              Utils.showSnackBar(
                                context,
                                Text('Only $qty left in stock!'),
                              );
                          },
                        ),
                      ),
                      SizedBox(width: 5),
                      Container(
                        width: 50,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            primary: Colors.white,
                            side: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          child: Icon(
                            Icons.remove,
                            color: Colors.black,
                            size: 18,
                          ),
                          onPressed: () {
                            Provider.of<Cart>(context, listen: false)
                                .removeSingleItem(product.id);

                            setState(() {
                              qty = qty == 0 ? 0 : qty - 1;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              trailing: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    ProductDetailScreen.routeName,
                    arguments: product,
                  );
                },
                child: Image.network(
                  product.imageUrl[0],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Divider(),
            Container(
              width: double.infinity,
              child: TextButton.icon(
                icon: Icon(Icons.delete),
                label: Text('Remove'),
                onPressed: () {
                  Provider.of<Cart>(context, listen: false)
                      .removeItem(product.id);

                  setState(() {});
                },
                style: ButtonStyle(
                  overlayColor:
                      MaterialStateProperty.all(Colors.black.withOpacity(0.1)),
                  elevation: MaterialStateProperty.all(0),
                  foregroundColor: MaterialStateProperty.all(Colors.black45),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
