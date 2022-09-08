import 'package:flutter_academy/infrastructure/model/course.model.dart';

class CourseVM {
  final Course course;
  CourseVM(this.course);
  String get title => course.title;
  String get description => course.description;
  String get image => course.image;
}
