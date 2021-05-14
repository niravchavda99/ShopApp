import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/Auth.dart';
import 'package:shop_app/screens/OrdersScreen.dart';
import 'package:shop_app/screens/SplashScreen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final name = Provider.of<Auth>(context, listen: false).user.name;

    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Row(
              children: [
                CircleAvatar(
                  child: Icon(Icons.person_rounded),
                  backgroundColor: Colors.white,
                  minRadius: 14,
                ),
                SizedBox(width: 10),
                Text('Hello $name!'),
              ],
            ),
            automaticallyImplyLeading: false,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(OrdersScreen.routeName);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.shopping_bag),
                title: Text('My orders'),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Provider.of<Auth>(context, listen: false).logout();
              Navigator.of(context)
                  .pushReplacementNamed(SplashScreen.routeName);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
