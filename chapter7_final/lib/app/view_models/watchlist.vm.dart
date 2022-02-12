import 'package:flutter_academy/infrastructure/model/course.model.dart';
import 'package:flutter_academy/infrastructure/res/watchlist.service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'course.vm.dart';

class WatchlistVM extends StateNotifier<List<CourseVM>> {
  WatchlistService _watchlistService;

  WatchlistVM(this._watchlistService) : super(const []) {
    getWatchlist();
  }

  Future<void> addToWatchlist(int id, Course course) async {
    await _watchlistService.addToWatchlist(id, course.toMap());
    this.state = [CourseVM(course), ...this.state];
  }

  Future<void> removeFromWatchlist(int id) async {
    await _watchlistService.removeFromWatchlist(id);
    this.state = this.state.where((course) => course.course.id != id).toList();
  }

  Future<void> getWatchlist() async {
    final watchlist = await _watchlistService.getWatchlist();
    this.state = [...watchlist.map((e) => CourseVM(Course.fromMap(e)))];
  }

  bool isInWatchlist(int id) {
    return this.state.where((element) => element.course.id == id).length != 0;
  }
}

final watchlistVM = StateNotifierProvider<WatchlistVM, List<CourseVM>>((_) => WatchlistVM(WatchlistService.instance));
