import 'package:appwrite/appwrite.dart';
import 'package:flutter_academy/infrastructure/res/appwrite.service.dart';
import '../model/course.model.dart';

class WatchlistService {
  static WatchlistService? _instance;
  final collectionId = 'watchlist';
  final databaseId = 'flutter_academy_db';
  final db = Databases(AppwriteService.instance.client);

  WatchlistService._();

  static WatchlistService get instance {
    if (_instance == null) {
      _instance = WatchlistService._();
    }
    return _instance!;
  }

  Future<void> addToWatchlist(String id, String userId) async {
    db.createDocument(
      databaseId: databaseId,
      collectionId: collectionId,
      documentId: 'unique()',
      data: {
        'userId': userId,
        'courseId': id,
      },
      permissions: [
        Permission.read(Role.user(userId)),
        Permission.write(Role.user(userId))
      ],
    );
  }

  Future<void> removeFromWatchlist(String id) async {
    final doc = await db.listDocuments(
      databaseId: databaseId,
        collectionId: collectionId, queries: [Query.equal('courseId', id)]);
    if (doc.total > 0) {
      await db.deleteDocument(
        databaseId: databaseId,
          collectionId: collectionId, documentId: doc.documents[0].$id);
    }
  }

  Future<List<Course>> getWatchlist() async {
    final docList = await db.listDocuments(databaseId: databaseId, collectionId: collectionId);
    final docIds = docList.documents.map((doc) => doc.$id).toList();
    final courseList = await db.listDocuments(
      databaseId: databaseId,
      collectionId: 'courses',
      queries: [Query.equal('\$id', docIds)],
    );
    return courseList
        .convertTo((p0) => Course.fromMap(Map<String, dynamic>.from(p0)));
  }
}
