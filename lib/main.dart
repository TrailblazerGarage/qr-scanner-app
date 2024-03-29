import 'package:flutter/material.dart';
import 'package:qr_scanner_app/src/pages/directions_page.dart';
import 'package:qr_scanner_app/src/pages/home_page.dart';
import 'package:qr_scanner_app/src/pages/map_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Scanner App',
        initialRoute: 'home',
        routes: {
          'home': (BuildContext context) => HomePage(),
          'map': (BuildContext context) => MapPage(),
          'directions': (BuildContext context) => DirectionsPage()
        },
        theme: ThemeData(primaryColor: Colors.deepPurple));
  }
}
