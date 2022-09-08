import 'package:flutter/material.dart';
import 'package:flutter_academy/app/view_models/course.vm.dart';
import 'package:flutter_academy/app/view_models/watchlist.vm.dart';
import 'package:flutter_academy/app/widgets/course_card.widget.dart';
import 'package:flutter_academy/infrastructure/model/course.model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../res/responsive.res.dart';
import '../widgets/drawer_nav.widget.dart';
import '../widgets/top_nav.widget.dart';

class WatchlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          TopNav(),
          Expanded(
            child: Consumer(
              builder: ((context, ref, child) {
                final width = MediaQuery.of(context).size.width;
                final List<CourseVM> courses = ref.watch(watchlistVM);
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: width > ScreenSizes.xl ? 4 : width > ScreenSizes.lg ? 3 : width > ScreenSizes.md ? 2 : 1,
                  ),
                  itemBuilder: (context, index) {
                    final course = courses[index];
                    return CourseCard(
                        id: course.course.id,
                        image: course.image,
                        title: course.title,
                        onActionPressed: () {},
                        description: course.description);
                  },
                  itemCount: courses.length,
                );
              }),
            ),
          ),
        ],
      ),
      drawer: MediaQuery.of(context).size.width > ScreenSizes.md
          ? null
          : DrawerNav(),
    );
  }
}
