import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_academy/app/res/responsive.res.dart';
import 'package:flutter_academy/main.dart';

class TopNav extends StatelessWidget {
  const TopNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Flutter Academy'),
      elevation: kIsWeb ? 0 : null,
      centerTitle: kIsWeb ? false : null,
      actions: (MediaQuery.of(context).size.width <= ScreenSizes.md)
          ? null
          : [
              TextButton(
                child: Text("Home"),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                ),
                onPressed: () {
                  routerDelegate.go('/');
                },
              ),
              TextButton(
                child: Text("Courses"),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                ),
                onPressed: () {
                  routerDelegate.go('/courses');
                },
              ),
              TextButton(
                child: Text("About"),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                ),
                onPressed: () {
                  routerDelegate.go('/about');
                },
              ),
              TextButton(
                child: Text("Contact"),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                ),
                onPressed: () {
                  routerDelegate.go('/contact');
                },
              ),
            ],
    );
  }
}
