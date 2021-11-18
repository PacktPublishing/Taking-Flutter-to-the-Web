import 'package:flutter/material.dart';
import 'package:flutter_academy/pages/about_page.dart';
import 'package:flutter_academy/pages/contact_page.dart';
import 'package:flutter_academy/pages/course_details_page.dart';
import 'package:flutter_academy/pages/courses_page.dart';
import 'package:flutter_academy/pages/error_404_page.dart';
import 'package:flutter_academy/pages/home_page.dart';
import 'package:flutter_academy/routes/app_route_parser.dart';
import 'package:flutter_academy/routes/app_route_path.dart';
import 'package:flutter_academy/routes/router_delegate.dart';

void main() {
  runApp(MyApp());
}

final routerDelegate = AppRouterDelegate();

class MyApp extends StatelessWidget {
  final _routeParser = AppRouteInformationParser();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: routerDelegate,
      routeInformationParser: _routeParser,
      // routes: {
      //   '/': (_) => HomePage(),
      //   '/about': (_) => AboutPage(),
      //   '/contact': (_) => ContactPage(),
      //   '/courses': (_) => CoursesPage(),
      // },
      // onGenerateRoute: (settings) {
      //   return MaterialPageRoute(
      //     builder: (_) {
      //       switch (settings.name) {
      //         case '/':
      //           return HomePage();
      //         case '/about':
      //           return AboutPage();
      //         case '/contact':
      //           return ContactPage();
      //         case '/courses':
      //           return CoursesPage();
      //         default:
      //           final pathSegments = Uri.parse(settings.name!).pathSegments;
      //           print(pathSegments);
      //           if (pathSegments.length == 2 && pathSegments[0] == 'courses') {
      //             final courseId = int.parse(pathSegments[1]);
      //             return CourseDetailsPage(courseId: courseId);
      //           }
      //           return Error404Page();
      //       }
      //     },
      //     settings: settings,
      //   );
      // },
    );
  }
}
