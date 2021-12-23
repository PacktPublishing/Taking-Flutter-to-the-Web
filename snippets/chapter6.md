# Chapter 6 Snippets

## 6.1
```dart
import 'package:flutter/material.dart';
import 'package:flutter_academy/app/view_models/auth.vm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            title: Text("Dashboard"),
          ),
          Expanded(
            child: Row(
              children: [
                NavigationRail(
                  destinations: [
                    NavigationRailDestination(
                      icon: Icon(Icons.home),
                      label: Text("Dashboard"),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.book),
                      label: Text("Courses"),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.exit_to_app),
                      label: Text("Logout"),
                    ),
                  ],
                  selectedIndex: 0,
                  minWidth: 100,
                  labelType: NavigationRailLabelType.all,
                  onDestinationSelected: (dest) {},
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(32.0),
                    children: <Widget>[Text("Dashboard Page")],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
```