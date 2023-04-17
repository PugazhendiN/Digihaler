// import 'dart:async';

import 'package:flutter/material.dart';
import 'package:inhaler_mobile/screens/branding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen() : super();

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: InkWell(
        onTap: () async {
          await Navigator.push(context,
              MaterialPageRoute(builder: (context) => BrandingScreen()));
        },
        child: Container(
            color: Theme.of(context).primaryColor,
            child: Center(
              child: CircularProgressIndicator(
                  backgroundColor: Colors.red,
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.white)),
            )),
      ),
    );
  }
}
