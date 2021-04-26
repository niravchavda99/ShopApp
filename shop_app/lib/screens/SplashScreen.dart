import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/Auth.dart';
import 'package:shop_app/screens/AuthScreen.dart';
import 'package:shop_app/screens/HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash-screen';

  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<Auth>(context, listen: false).tryAutoLogin();

    Timer(Duration(seconds: 2), () {
      if (Provider.of<Auth>(context, listen: false).isAuth)
        Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
      else
        Navigator.of(context).pushReplacementNamed(AuthScreen.routeName);
    });

    return Scaffold(
      body: Center(
        child: Container(
          child: Image.asset('assets/images/myShopLogoDark.png'),
        ),
      ),
    );

    // return Scaffold(
    //   body: FadeTransition(
    //     opacity: _animation,
    //     child: Center(
    //       child: Container(
    //         child: Image.asset('assets/images/myShopLogo.png'),
    //       ),
    //     ),
    //   ),
    // );
  }
}
