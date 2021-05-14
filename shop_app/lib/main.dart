import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/Auth.dart';
import 'package:shop_app/providers/Brands.dart';
import 'package:shop_app/providers/Cart.dart';
import 'package:shop_app/providers/Categories.dart';
import 'package:shop_app/providers/Favorites.dart';
import 'package:shop_app/providers/Orders.dart';
import 'package:shop_app/providers/Products.dart';
import 'package:shop_app/screens/AuthScreen.dart';
import 'package:shop_app/screens/CartScreen.dart';
import 'package:shop_app/screens/HomeScreen.dart';
import 'package:shop_app/screens/OrdersScreen.dart';
import 'package:shop_app/screens/ProductDetailScreen.dart';
import 'package:shop_app/screens/ProductsOverviewScreen.dart';
import 'package:shop_app/screens/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final customColor = MaterialColor(0xff00bfa5, {
    50: Color(0xffe0f2f1),
    100: Color(0xffb2dfdb),
    200: Color(0xff80cbc4),
    300: Color(0xff4db6ac),
    400: Color(0xff26a69a),
    500: Color(0xff009688),
    600: Color(0xff00897b),
    700: Color(0xff00796b),
    800: Color(0xff00695c),
    900: Color(0xff004d40),
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Auth>(create: (ctx) => Auth()),
        ChangeNotifierProvider<Products>(create: (ctx) => Products()),
        ChangeNotifierProvider<Categories>(create: (ctx) => Categories()),
        ChangeNotifierProvider<Brands>(create: (ctx) => Brands()),
        ChangeNotifierProvider<Cart>(create: (ctx) => Cart()),
        ChangeNotifierProvider<Favorites>(create: (ctx) => Favorites()),
        ChangeNotifierProvider<Orders>(create: (ctx) => Orders()),
      ],
      child: MaterialApp(
        title: 'Shop App',
        theme: ThemeData(
          // primarySwatch: Colors.teal,
          primarySwatch: Colors.indigo,
          // accentColor: Colors.teal,
          accentColor: customColor,
        ),
        routes: {
          SplashScreen.routeName: (ctx) => SplashScreen(),
          AuthScreen.routeName: (ctx) => AuthScreen(),
          HomeScreen.routeName: (ctx) => HomeScreen(),
          ProductsOverviewScreen.routeName: (ctx) => ProductsOverviewScreen(),
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
        },
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}
