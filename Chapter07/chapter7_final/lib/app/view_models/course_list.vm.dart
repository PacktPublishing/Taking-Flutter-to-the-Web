import 'package:flutter_academy/app/view_models/course.vm.dart';
import 'package:flutter_academy/infrastructure/res/course.service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CourseListVM extends StateNotifier<List<CourseVM>> {
  CourseListVM() : super(const []) {
    fetchCourses();
  }
  Future<void> fetchCourses() async {
    final res = await CourseService().getCourses();
    this.state = [...res.map((course) => CourseVM(course))];
  }
}

final courseListVM = StateNotifierProvider<CourseListVM, List<CourseVM>>(
    (ref) => CourseListVM());
