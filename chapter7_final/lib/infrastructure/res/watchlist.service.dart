import 'package:hive_flutter/hive_flutter.dart';

class WatchlistService {
  static WatchlistService? _instance;
  final String boxName = 'watchlist';

  WatchlistService._();

  static WatchlistService get instance {
    if (_instance == null) {
      _instance = WatchlistService._();
    }
    return _instance!;
  }

  Future<void> addToWatchlist(int id, Map<String, dynamic> course) async {
    final box = await Hive.openBox<Map<String, dynamic>>(boxName);
    if (box.get(id) == null) {
      box.put(id, course);
    }
  }

  Future<void> removeFromWatchlist(int id) async {
    final box = await Hive.openBox<Map<String, dynamic>>(boxName);
    box.delete(id);
  }

  Future<bool> isInWatchlist(int id) async {
    final box = await Hive.openBox<Map<String, dynamic>>(boxName);
    return box.containsKey(id);
  }

  Future<Iterable<Map<String, dynamic>>> getWatchlist() async {
    final box = await Hive.openBox<Map<String, dynamic>>(boxName);
    return box.values;
  }
}
