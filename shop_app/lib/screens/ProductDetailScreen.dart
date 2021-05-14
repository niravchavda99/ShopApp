import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/Offer.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/providers/Auth.dart';
import 'package:shop_app/providers/Cart.dart';
import 'package:shop_app/providers/Favorites.dart';
import 'package:shop_app/screens/CartScreen.dart';
import 'package:shop_app/utils/Utils.dart';
import 'package:shop_app/widgets/AddToCartDropdown.dart';
import 'package:shop_app/widgets/ProductRating.dart';

class ProductDetailScreen extends StatefulWidget {
  static const routeName = '/product-detail';

  const ProductDetailScreen({Key key}) : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool isFavorite;

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context).settings.arguments as Product;
    final imagesCount = product.imageUrl.length;
    final username = Provider.of<Auth>(context, listen: false).username;

    setState(() {
      isFavorite =
          Provider.of<Favorites>(context).isFavorite(username, product.id);
    });

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Container(
          height: 40,
          child: Image.asset('assets/images/myShopLogo.png'),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.only(right: 20, top: 10),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: ProductRating(
                        product.rating,
                        color: Theme.of(context).accentColor,
                        size: 15,
                      ),
                    ),
                  ),
                  Container(
                    child: _buildImageCarousel(imagesCount, context, product),
                    color: Colors.white,
                  ),
                  _buildInfo(product),
                  SizedBox(height: 10),
                  _buildOffers(product),
                  SizedBox(height: 10),
                  _buildDescription(product),
                  SizedBox(height: 10),
                  _buildHighlights(product),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
          _buildBottomButtons(context, username, product),
        ],
      ),
    );
  }

  Widget _buildInfo(Product product) {
    final discountedPrice =
        (product.price - (product.price * product.discount / 100)).toInt();
    final discountGiven = product.price - discountedPrice;

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.title,
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          SizedBox(height: 5),
          _buildRatingBadge(product.rating),
          SizedBox(height: 10),
          Row(
            children: [
              Text(
                '₹',
                style: TextStyle(fontSize: 15),
              ),
              Text(
                discountedPrice.toString(),
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Text(
                'MRP: ',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                '₹' + product.price.toString(),
                style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  fontSize: 18,
                ),
              ),
              SizedBox(width: 10),
              Text(
                'Save ₹$discountGiven',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.red[800],
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Text('No Cost EMI Available.'),
          SizedBox(height: 5),
          Text('Free delivery'),
          SizedBox(height: 10),
          product.numberInStock < 1
              ? Text(
                  'Out of Stock!',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : product.numberInStock > 9
                  ? Text('Left in stock: ${product.numberInStock}')
                  : Text(
                      'Hurry, Only ${product.numberInStock} left!',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
          if (product.numberInStock > 0) AddToCartDropdown(product: product),
        ],
      ),
    );
  }

  Widget _buildHighlights(Product product) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'Highlights',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Divider(),
          ...product.features.entries
              .map((e) => Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                              e.key,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                            Expanded(child: Text(e.value)),
                          ],
                        ),
                      ),
                      Divider(),
                    ],
                  ))
              .toList(),
        ],
      ),
    );
  }

  Widget _buildDescription(Product product) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'Description',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Text(product.description),
        ],
      ),
    );
  }

  ButtonStyle _getButtonStyle(Color fgColor, Color bgColor, Color ovColor) {
    return ButtonStyle(
      shape: MaterialStateProperty.resolveWith(
          (_) => RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
      overlayColor: MaterialStateProperty.resolveWith((_) => ovColor),
      minimumSize: MaterialStateProperty.resolveWith((_) => Size(60, 60)),
      backgroundColor: MaterialStateProperty.resolveWith((_) => bgColor),
      foregroundColor: MaterialStateProperty.resolveWith((_) => fgColor),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }

  Widget _buildBottomButtons(
      BuildContext context, String username, Product product) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          blurRadius: 10,
          offset: Offset(1, 6),
          color: Colors.black,
        )
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: ElevatedButton.icon(
              icon: Icon(
                isFavorite ? Icons.check : Icons.favorite,
                color: Colors.red,
              ),
              label:
                  Text(!isFavorite ? 'Add to Favorites' : 'Added to Favorites'),
              style: _getButtonStyle(Colors.black, Colors.white,
                  Theme.of(context).accentColor.withOpacity(0.3)),
              onPressed: () {
                _buildFavoriteSnackBar(context);
                setState(() {
                  if (!isFavorite)
                    Provider.of<Favorites>(context, listen: false)
                        .addFavorite(username, product.id);
                  else
                    Provider.of<Favorites>(context, listen: false)
                        .removeFavorite(username, product.id);
                  isFavorite = !isFavorite;
                });
              },
            ),
          ),
          Expanded(
            child: ElevatedButton.icon(
              icon: Icon(Icons.shopping_cart),
              label: Text('Add to Cart'),
              style: _getButtonStyle(Colors.white,
                  Theme.of(context).accentColor, Colors.white.withOpacity(0.3)),

              // style: _getButtonStyle(Colors.black,
              // Theme.of(context).accentColor, Colors.white.withOpacity(0.3)),
              onPressed: () async {
                if (product.numberInStock < 1) {
                  Utils.showSnackBar(
                      context, Text('This item is out of stock!'));
                  return;
                }

                await Provider.of<Cart>(context, listen: false)
                    .addItem(product: product, qty: 1);
                _buildCartSnackBar(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  void _buildFavoriteSnackBar(BuildContext context) {
    return Utils.showSnackBar(
      context,
      Row(
        children: [
          Icon(
            Icons.favorite,
            color: Colors.white,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Text(!isFavorite
                ? 'Added to favorites!'
                : 'Removed from favorites!'),
          ),
        ],
      ),
    );
  }

  void _buildCartSnackBar(BuildContext context) {
    return Utils.showSnackBar(
      context,
      Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Icon(
                  Icons.check,
                  color: Colors.white,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Text('Added to Cart'),
                ),
              ],
            ),
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              primary: Colors.white,
              side: BorderSide(color: Colors.white),
            ),
            child: Text('View Cart'),
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              Navigator.of(context).pushNamed(CartScreen.routeName);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildOffer(OfferType type, List<Offer> offers) {
    return Column(
      children: offers
          .map((o) => Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.local_offer,
                      color: Colors.green,
                      size: 16,
                    ),
                    SizedBox(width: 10),
                    Text(
                      o.type + ': ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Text(
                        o.title,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ],
                ),
              ))
          .toList(),
    );
  }

  Widget _buildOffers(Product product) {
    Map<OfferType, List<Offer>> allOffers = {};

    OfferType.values.forEach((type) {
      allOffers.putIfAbsent(type, () => product.getOffers(type));
    });

    return Container(
      width: double.infinity,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
      color: Colors.white,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(8),
            child: Text(
              'Available Offers',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          ...(allOffers.entries
              .toList()
              .map((o) => _buildOffer(o.key, o.value))
              .toList()),
        ],
      ),
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
        borderRadius: BorderRadius.circular(2),
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

  Widget _buildImageCarousel(
      int imagesCount, BuildContext context, Product product) {
    return CarouselSlider.builder(
      itemCount: imagesCount,
      itemBuilder: (ctx, i, j) => Container(
        width: MediaQuery.of(context).size.width,
        height: 315,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 300,
              ),
              child: Center(
                child: Image.network(
                  product.imageUrl[i],
                ),
              ),
            ),
            SizedBox(height: 10),
            Text('${i + 1}/$imagesCount'),
          ],
        ),
      ),
      options: CarouselOptions(height: 350),
    );
  }
}
