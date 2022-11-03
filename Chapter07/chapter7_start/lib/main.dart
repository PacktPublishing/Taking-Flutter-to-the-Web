import 'package:flutter/material.dart';
import 'app/routes/app_route_parser.router.dart';
import 'app/routes/router_delegate.router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

final routerDelegate = AppRouterDelegate();

class MyApp extends StatelessWidget {
  final _routeParser = AppRouteInformationParser();
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return MaterialApp.router(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        darkTheme: ThemeData.dark().copyWith(
          primaryColor: Colors.blue,
        ),
        routerDelegate: routerDelegate,
        routeInformationParser: _routeParser,
      );
    });
  }
}
