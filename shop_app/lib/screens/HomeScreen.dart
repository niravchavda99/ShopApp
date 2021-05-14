import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/Cart.dart';
import 'package:shop_app/screens/ProductDetailScreen.dart';
import 'package:shop_app/screens/ProductsOverviewScreen.dart';
import 'package:shop_app/widgets/CartBadge.dart';
import '../widgets/MainDrawer.dart';

import '../models/Product.dart';
import '../models/Category.dart';
import '../models/Brand.dart';

import '../providers/Products.dart';
import '../providers/Categories.dart';
import '../providers/Brands.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final brands = Provider.of<Brands>(context).brands;
    final categories = Provider.of<Categories>(context).categories;
    final cartItems = Provider.of<Cart>(context).itemCount;

    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 40,
          child: Image.asset('assets/images/myShopLogo.png'),
        ),
        centerTitle: true,
        brightness: Brightness.dark,
        actions: [
          CartBadge(count: cartItems),
        ],
      ),
      body: Column(
        children: [
          _buildSearchBox(context),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  _buildShopByCategory(context, categories),
                  SizedBox(height: 10),
                  _buildShopByBrand(context, brands),
                  SizedBox(height: 10),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      'Shop now',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildRandomProducts(context),
                ],
              ),
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }

  List<Product> _getRandomProducts(List<Product> products) {
    final randomNumbers = Set<int>();

    for (var i = 0; i < 3; i++) {
      randomNumbers.add(math.Random().nextInt(products.length));
    }

    return randomNumbers.map((n) => products[n]).toList();
  }

  Widget _buildRandomProducts(BuildContext context) {
    final products = Provider.of<Products>(context).products;
    final randomProducts = _getRandomProducts(products);
    final availableWidth = MediaQuery.of(context).size.width;

    return Column(
      children: randomProducts
          .map((p) => Padding(
                padding: const EdgeInsets.all(8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: availableWidth,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          ProductDetailScreen.routeName,
                          arguments: p,
                        );
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          FadeInImage(
                            placeholder:
                                AssetImage('assets/images/product.png'),
                            image: NetworkImage(p.imageUrl[0]),
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            top: 0,
                            child: Container(
                              width: availableWidth,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              color: Colors.black.withOpacity(0.5),
                              child: Text(
                                p.title,
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              width: availableWidth,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              color: Colors.black.withOpacity(0.5),
                              child: Text(
                                '₹ ${p.discountedPrice.toInt()}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }

  Widget _buildRow(BuildContext context, String header,
      List<Map<String, String>> texts, String type) {
    // final colors = Utils.getColors(texts.length);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      color: Colors.black12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              header,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            margin: const EdgeInsets.only(left: 18),
          ),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: texts
                  .asMap()
                  .entries
                  .map((text) => InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              ProductsOverviewScreen.routeName,
                              arguments: {
                                "type": type,
                                "value": text.value['name']
                              });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Theme.of(context).primaryColor),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(text.value['imageUrl']),
                                  backgroundColor: Colors.transparent,
                                  child: null,
                                  minRadius: 25,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(text.value['name']),
                            ],
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShopByCategory(BuildContext context, List<Category> categories) {
    return _buildRow(
        context,
        'Shop by Category',
        categories
            .map((c) => {"name": c.name, "imageUrl": c.imageUrl})
            .toList(),
        "category");
  }

  Widget _buildShopByBrand(BuildContext context, List<Brand> brands) {
    return _buildRow(
        context,
        'Shop by Brand',
        brands.map((b) => {"name": b.name, "imageUrl": b.imageUrl}).toList(),
        "brand");
  }

  Widget _buildSearchBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Search...',
          contentPadding: const EdgeInsets.all(8),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
