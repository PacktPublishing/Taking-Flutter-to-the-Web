import 'package:flutter/material.dart';
import 'package:flutter_academy/pages/about_page.dart';

class DrawerNav extends StatelessWidget {
  const DrawerNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Flutter Academy",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: Colors.white),
            ),
          ),
          ListTile(
            title: Text("Home"),
            onTap: () {
              Navigator.of(context).pushNamed('/');
            },
          ),
          ListTile(
            title: Text("Courses"),
            onTap: () {},
          ),
          ListTile(
            title: Text("About"),
            onTap: () {
              Navigator.of(context).pushNamed('/about');
            },
          ),
          ListTile(
            title: Text("Contact"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
