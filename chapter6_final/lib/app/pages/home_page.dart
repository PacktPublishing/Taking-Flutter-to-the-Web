import 'package:flutter/material.dart';
import 'package:flutter_academy/app/res/assets.dart';
import 'package:flutter_academy/app/res/responsive.dart';
import 'package:flutter_academy/app/view_models/course_list_vm.dart';
import 'package:flutter_academy/app/widgets/call_to_action.dart';
import 'package:flutter_academy/app/widgets/course_card.dart';
import 'package:flutter_academy/app/widgets/drawer_nav.dart';
import 'package:flutter_academy/app/widgets/featured_section.dart';
import 'package:flutter_academy/app/widgets/footer.dart';
import 'package:flutter_academy/app/widgets/header.dart';
import 'package:flutter_academy/app/widgets/top_nav.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          TopNav(),
          Header(),
          const SizedBox(height: 40.0),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text("Recent courses",
                style: Theme.of(context).textTheme.headline3),
          ),
          const SizedBox(height: 10.0),
          Container(
            height: 450,
            child: Consumer(builder: (context, ref, child) {
              final courses = ref.watch(courseListVM);
              return ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ...courses.map(
                    (course) => Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: CourseCard(
                          description: course.description,
                          title: course.title,
                          image: course.image,
                          onActionPressed: () {},
                        )),
                  ),
                ],
              );
            }),
          ),
          // Featured section
          Center(
            child: FeaturedSection(
              image: Assets.instructor,
              title: "Start teaching today",
              description:
                  "Instructors from around the world teach millions of students on Udemy. We provide the tools and skills to teach what you love.",
              buttonLabel: "Become an instructor",
              onActionPressed: () {},
            ),
          ),
          Center(
            child: FeaturedSection(
              imageLeft: false,
              image: Assets.instructor,
              title: "Transform your life through education",
              description:
                  "Education changes your life beyond your imagination. Education enables you to achieve your dreams.",
              buttonLabel: "Start learning",
              onActionPressed: () {},
            ),
          ),
          CallToAction(),
          Center(
            child: FeaturedSection(
              imageLeft: false,
              image: Assets.instructor,
              title: "Know your instructors",
              description:
                  "Know your instructors. We have chosen the best of them to give you highest quality courses.",
              buttonLabel: "Browse",
              onActionPressed: () {},
            ),
          ),
          //footer
          Footer(),
        ],
      ),
      drawer: MediaQuery.of(context).size.width > ScreenSizes.md
          ? null
          : DrawerNav(),
    );
  }
}
