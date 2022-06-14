import 'package:appwrite/appwrite.dart';
import 'package:flutter_academy/infrastructure/model/course.model.dart';

import 'appwrite.service.dart';

class CourseService {
  final database = Database(AppwriteService.instance.client);
  Future<List<Course>> getCourses() async {
    final docs =
        await database.listDocuments(collectionId: 'courses', queries: [
      Query.equal('status', 'published'),
    ]);
    return docs
        .convertTo((data) => Course.fromMap(Map<String, dynamic>.from(data)));
  }
}
