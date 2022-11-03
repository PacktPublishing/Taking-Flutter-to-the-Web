
import '../model/course.model.dart';

class WatchlistService {
  static WatchlistService? _instance;
  final collectionId = 'courses';

  WatchlistService._();

  static WatchlistService get instance {
    if (_instance == null) {
      _instance = WatchlistService._();
    }
    return _instance!;
  }

  Future<void> addToWatchlist(String id, String userId) async {
  }

  Future<void> removeFromWatchlist(String id, String userId) async {
  }

  Future<List<Course>> getWatchlist(String userId) async {
  }
}
