import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_academy/infrastructure/model/course.model.dart';

class CourseService {
  Future<List<Course>> getCourses() async {
    final courses = await rootBundle.loadString('data/courses.json');
    return List<Course>.from(jsonDecode(courses).map((course) => Course.fromMap(course)));
  }
}
