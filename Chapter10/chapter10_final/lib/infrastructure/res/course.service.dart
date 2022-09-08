import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_academy/infrastructure/model/course.model.dart';

class CourseService {
  final _db = FirebaseFirestore.instance;
  Future<List<Course>> getCourses() async {
    final query = await _db.collection('courses').get();
    return query.docs.map((e) => Course.fromMap(e.id, e.data())).toList();
  }
}
