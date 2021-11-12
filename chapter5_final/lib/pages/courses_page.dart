import 'package:flutter/material.dart';
import 'package:flutter_academy/res/responsive.dart';
import 'package:flutter_academy/widgets/drawer_nav.dart';
import 'package:flutter_academy/widgets/top_nav.dart';

class CoursesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          TopNav(),
        ],
      ),
      drawer: MediaQuery.of(context).size.width > ScreenSizes.md
          ? null
          : DrawerNav(),
    );
  }
}
