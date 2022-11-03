import 'package:flutter_academy/app/view_models/auth.vm.dart';
import 'package:flutter_academy/infrastructure/res/watchlist.service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'course.vm.dart';

class WatchlistVM extends StateNotifier<List<CourseVM>> {
  WatchlistService _watchlistService;
  final String? userId;

  WatchlistVM(this._watchlistService, {this.userId}) : super(const []) {
    getWatchlist();
  }

  Future<void> addToWatchlist(String id) async {
    if (userId == null) return;
    await _watchlistService.addToWatchlist(id, userId!);
    await getWatchlist();
  }

  Future<void> removeFromWatchlist(String id) async {
    if (userId == null) return;
    await _watchlistService.removeFromWatchlist(id, userId!);
    this.state = this.state.where((course) => course.course.id != id).toList();
  }

  Future<void> getWatchlist() async {
    if (userId == null) return;
    final watchlist = await _watchlistService.getWatchlist(userId!);
    var courses = [];
    for (final course in watchlist) {
      courses = [CourseVM(course), ...this.state];
    }
    this.state = [...courses];
  }

  bool isInWatchlist(String id) {
    return this.state.where((element) => element.course.id == id).length != 0;
  }
}

final watchlistVM =
    StateNotifierProvider<WatchlistVM, List<CourseVM>>((ref) => WatchlistVM(
          WatchlistService.instance,
          userId: ref.watch(authVM.notifier).user?.id,
        ));
