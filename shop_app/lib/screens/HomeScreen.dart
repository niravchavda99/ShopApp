import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/Cart.dart';
import 'package:shop_app/screens/CartScreen.dart';
import 'package:shop_app/screens/ProductsOverviewScreen.dart';
import '../widgets/MainDrawer.dart';

import '../models/Product.dart';
import '../models/Category.dart';
import '../models/Brand.dart';

import '../providers/Products.dart';
import '../providers/Categories.dart';
import '../providers/Brands.dart';

import '../utils/Utils.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final brands = Provider.of<Brands>(context).brands;
    final categories = Provider.of<Categories>(context).categories;
    final products = Provider.of<Products>(context).products;
    final cartItems = Provider.of<Cart>(context).itemCount;

    final randomProducts = _getRandomProducts(products);

    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 40,
          child: Image.asset('assets/images/myShopLogo.png'),
        ),
        centerTitle: true,
        brightness: Brightness.dark,
        actions: [
          _buildCartBadge(context, cartItems),
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
                  Column(
                    children: randomProducts
                        .map((p) => Container(
                              width: double.infinity,
                              child: Image.network(
                                p.imageUrl[0],
                                fit: BoxFit.cover,
                              ),
                            ))
                        .toList(),
                  ),
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

  Widget _buildRow(BuildContext context, String header,
      List<Map<String, String>> texts, String type) {
    final colors = Utils.getColors(texts.length);

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
                              CircleAvatar(
                                backgroundImage:
                                    NetworkImage(text.value['imageUrl']),
                                backgroundColor:
                                    colors[text.key % texts.length],
                                // child: null,
                                minRadius: 25,
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

  Widget _buildCartBadge(BuildContext context, int count) {
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
