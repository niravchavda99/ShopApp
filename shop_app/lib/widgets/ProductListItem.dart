import 'package:flutter/material.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/ProductDetailScreen.dart';
import 'package:shop_app/widgets/ProductRating.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem({Key key, this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final discountedPrice =
        (product.price - (product.price * product.discount / 100)).toInt();
    final discountGiven = product.price - discountedPrice;

    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 130,
      ),
      child: Card(
        elevation: 5,
        child: InkWell(
          onTap: () {
            Navigator.of(context)
                .pushNamed(ProductDetailScreen.routeName, arguments: product);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 130,
                height: 130,
                child: Image.network(
                  product.imageUrl[0],
                ),
              ),
              SizedBox(width: 15),
              Container(
                margin: const EdgeInsets.only(top: 20),
                width: size.width - 130 - 25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 10),
                    ProductRating(
                      product.rating,
                      color: Theme.of(context).accentColor,
                      size: 20,
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          '₹',
                          style:
                              TextStyle(color: Colors.red[800], fontSize: 12),
                        ),
                        Text(
                          discountedPrice.toString(),
                          style:
                              TextStyle(color: Colors.red[800], fontSize: 18),
                        ),
                        SizedBox(width: 3),
                        Text(
                          '₹${product.price}',
                          style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        SizedBox(width: 6),
                        Text('Save ₹$discountGiven (${product.discount}%)'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
