import 'package:cloud_firestore/cloud_firestore.dart';

final courses = [
  {
    "title": "Flutter Beginners",
    "description":
        "Awesome course for Flutter beginners to learn the basics of Flutter framework",
    "image": "https://image-placeholder.com/image.png",
    "status": "published",
    "published_date": FieldValue.serverTimestamp(),
  },
];

Future loadCourses() async {
  final _db = FirebaseFirestore.instance;
  for (final course in courses) {
    _db.collection('courses').add(course);
  }
}
