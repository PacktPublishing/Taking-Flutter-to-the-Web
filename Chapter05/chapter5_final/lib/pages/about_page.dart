import 'package:flutter/material.dart';
import 'package:flutter_academy/res/responsive.dart';
import 'package:flutter_academy/widgets/drawer_nav.dart';
import 'package:flutter_academy/widgets/top_nav.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          TopNav(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("About Page"),
          )
        ],
      ),
      drawer: MediaQuery.of(context).size.width > ScreenSizes.md
          ? null
          : DrawerNav(),
    );
  }
}
