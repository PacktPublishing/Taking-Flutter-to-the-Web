import '../model/course.model.dart';

class WatchlistService {
  static WatchlistService? _instance;
  final collectionId = 'watchlist';
  final databaseId = 'flutter_academy_db';

  WatchlistService._();

  static WatchlistService get instance {
    if (_instance == null) {
      _instance = WatchlistService._();
    }
    return _instance!;
  }

  Future<void> addToWatchlist(String id, String userId) async {
    
  }

  Future<void> removeFromWatchlist(String id) async {
    
  }

  Future<List<Course>> getWatchlist() async {
    
  }
}
