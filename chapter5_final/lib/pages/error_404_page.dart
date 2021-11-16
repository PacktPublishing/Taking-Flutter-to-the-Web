import 'package:flutter/material.dart';

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
                Navigator.of(context).pushReplacementNamed('/');
              },
            )
          ],
        ),
      ),
    );
  }
}
