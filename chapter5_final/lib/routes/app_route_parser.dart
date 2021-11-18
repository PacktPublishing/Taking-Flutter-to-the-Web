import 'package:flutter/material.dart';

class AppRouteInformationParser extends RouteInformationParser<Uri> {
  @override
  Future<Uri> parseRouteInformation(RouteInformation routeInformation) async =>
      Uri.parse(routeInformation.location!);

  @override
  RouteInformation restoreRouteInformation(Uri configuration) {
    final String loc = Uri.decodeComponent(configuration.toString());
    return RouteInformation(location: loc);
  }
}
