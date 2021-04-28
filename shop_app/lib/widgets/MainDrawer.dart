import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/Auth.dart';
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
            title: Text('Hello $name!'),
            automaticallyImplyLeading: false,
          ),
          InkWell(
            onTap: () {
              Provider.of<Auth>(context, listen: false).logout();
              Navigator.of(context)
                  .pushReplacementNamed(SplashScreen.routeName);
            },
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
            ),
          ),
        ],
      ),
    );
  }
}
