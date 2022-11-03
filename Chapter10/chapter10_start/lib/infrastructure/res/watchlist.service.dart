import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/course.model.dart';

class WatchlistService {
  static WatchlistService? _instance;
  final collectionId = 'courses';
  final _db = FirebaseFirestore.instance;

  WatchlistService._();

  static WatchlistService get instance {
    if (_instance == null) {
      _instance = WatchlistService._();
    }
    return _instance!;
  }

  Future<void> addToWatchlist(String id, String userId) async {
    await _db.collection(collectionId).doc(id).update({
      "watchlist": FieldValue.arrayUnion([userId])
    });
  }

  Future<void> removeFromWatchlist(String id, String userId) async {
    await _db.collection(collectionId).doc(id).update({
      "watchlist": FieldValue.arrayRemove([userId])
    });
  }

  Future<List<Course>> getWatchlist(String userId) async {
    final qs = await _db
        .collection(collectionId)
        .where("watchlist", arrayContains: userId)
        .get();
    return qs.docs.map((doc) => Course.fromMap(doc.id, doc.data())).toList();
  }
}
