import 'package:flutter/material.dart';
import 'package:flutter_academy/scripts/load_courses.dart';

class LoadCourses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Load'),
        ),
        body: Center(
          child: ElevatedButton(
            child: Text("Load Courses"),
            onPressed: () {
              loadCourses();
            },
          ),
        ));
  }
}
