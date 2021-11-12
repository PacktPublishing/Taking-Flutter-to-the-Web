import 'package:flutter/material.dart';
import 'package:flutter_academy/pages/about_page.dart';
import 'package:flutter_academy/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (_) => HomePage(),
        '/about': (_) => AboutPage(),
      },
    );
  }
}
