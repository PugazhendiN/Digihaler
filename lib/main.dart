import 'package:flutter/material.dart';
import 'package:inhaler_mobile/screens/branding_screen.dart';
// import 'package:inhaler_mobile/screens/branding_screen.dart';
// import 'package:inhaler_mobile/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primaryColor: Color.fromRGBO(1, 156, 220, 1),
          primarySwatch: Colors.blue,
          //accentColor: Color.fromRGBO(217, 125, 84, 1),
          secondaryHeaderColor: Colors.blue.withOpacity(0.8)),
      home: BrandingScreen(),
    );
  }
}
