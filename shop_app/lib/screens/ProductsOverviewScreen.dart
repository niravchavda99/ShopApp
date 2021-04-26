import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/models/Category.dart';
import 'package:shop_app/models/Brand.dart';
import 'package:shop_app/providers/Products.dart';
import 'package:shop_app/providers/Categories.dart';
import 'package:shop_app/providers/Brands.dart';
import 'package:shop_app/widgets/ProductListItem.dart';

class ProductsOverviewScreen extends StatelessWidget {
  static const routeName = '/products-overview';

  const ProductsOverviewScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final criteria = args['type'] == 'category'
        ? Provider.of<Categories>(context).find(args['value'])
        : Provider.of<Brands>(context).find(args['value']);

    final products = args['type'] == 'category'
        ? Provider.of<Products>(context).fetchByCategory(criteria)
        : Provider.of<Products>(context).fetchByBrand(criteria);

    return Scaffold(
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
          _buildSearchBox(context),
          Expanded(
            child: SingleChildScrollView(
              physics: ScrollPhysics(),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: products.length,
                itemBuilder: (ctx, i) => Column(
                  children: [
                    ProductListItem(product: products[i]),
                    ProductListItem(product: products[i]),
                    ProductListItem(product: products[i]),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
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
