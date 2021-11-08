import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_academy/pages/about_page.dart';
import 'package:flutter_academy/res/responsive.dart';

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
                onPressed: () {},
              ),
              TextButton(
                child: Text("Courses"),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                ),
                onPressed: () {},
              ),
              TextButton(
                child: Text("About"),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => AboutPage()));
                },
              ),
              TextButton(
                child: Text("Contact"),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                ),
                onPressed: () {},
              ),
            ],
    );
  }
}
