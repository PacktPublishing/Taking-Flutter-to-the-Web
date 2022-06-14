import 'package:dart_appwrite/dart_appwrite.dart';
import 'config.dart' as config;

final client = Client()
    .setEndpoint(
        'https://8080-appwrite-integrationfor-458k5xf89zx.ws-us45.gitpod.io/v1')
    .setProject('6262cb3133564441c02d')
    .setKey(config.API_KEY);

void main(List<String> arguments) async {
  await createCollection();
  await addCourses();
  await createWatchlistCollection();
}

Future<void> createWatchlistCollection() async {
  final db = Database(client);
  final collection = await db.createCollection(
      collectionId: 'watchlist',
      name: "Watchlist",
      permission: 'document',
      read: [],
      write: []);
  await db.createStringAttribute(
      collectionId: 'watchlist', key: 'userId', size: 36, xrequired: true);
  await db.createStringAttribute(
      collectionId: 'watchlist', key: 'courseId', size: 36, xrequired: true);
  await Future.delayed(Duration(seconds: 5));
  await db.createIndex(
      collectionId: 'watchlist',
      key: 'course_id_index',
      type: 'key',
      attributes: ['courseId']);
}

final courses = [
  {
    "title": "Flutter Beginners",
    "description":
        "Awesome course for Flutter beginners to learn the basics of Flutter framework",
    "image": "https://image-placeholder.com/image.png",
    "status": "published",
    "published_date": DateTime.now().millisecondsSinceEpoch,
  },
];

Future<void> addCourses() async {
  final db = Database(client);
  for (final course in courses) {
    await db.createDocument(
        collectionId: 'courses', documentId: 'unique()', data: course);
  }
}

Future<void> createCollection() async {
  final db = Database(client);
  final collection = await db.createCollection(
    collectionId: 'courses',
    name: 'Courses',
    permission: 'document',
    read: [],
    write: [],
  );
  await db.createStringAttribute(
      collectionId: 'courses', key: 'title', size: 255, xrequired: true);
  await db.createStringAttribute(
      collectionId: 'courses',
      key: 'description',
      size: 1000,
      xrequired: false);
  await db.createStringAttribute(
      collectionId: 'courses', key: 'image', size: 255, xrequired: false);
  await db.createStringAttribute(
      collectionId: 'courses',
      key: 'status',
      size: 20,
      xrequired: false,
      xdefault: 'Draft');
  await db.createIntegerAttribute(
      collectionId: 'courses', key: 'published_date', xrequired: true);
  await Future.delayed(Duration(seconds: 5));
  await db.createIndex(
      collectionId: 'courses',
      key: 'status_index',
      type: 'key',
      attributes: ['status']);
}
