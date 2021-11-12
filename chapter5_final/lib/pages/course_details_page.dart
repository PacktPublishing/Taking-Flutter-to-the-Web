import 'package:flutter/material.dart';

class CourseDetailsPage extends StatelessWidget {
  final int courseId;

  const CourseDetailsPage({Key? key, required this.courseId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[],
      ),
    );
  }
}
