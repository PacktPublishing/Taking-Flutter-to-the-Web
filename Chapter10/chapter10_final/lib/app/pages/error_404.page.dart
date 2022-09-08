import 'package:flutter/material.dart';
import 'package:flutter_academy/main.dart';

class Error404Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('404'),
            ElevatedButton(
              child: Text('Go to Home'),
              onPressed: () {
                routerDelegate.go('/');
              },
            )
          ],
        ),
      ),
    );
  }
}
