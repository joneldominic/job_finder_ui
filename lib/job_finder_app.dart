import 'package:flutter/material.dart';

import './core/utils/route_list.dart' as routes;

import './pages/application_page.dart';
import './pages/home_page.dart';
import './pages/job_info_page.dart';
import './pages/search_page.dart';

class JobFinderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Job Finder',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: routes.HOME_ROUTE,
      routes: {
        routes.HOME_ROUTE: (_) => HomePage(),
        routes.SEARCH_ROUTE: (_) => SearchPage(),
        routes.JOB_INFO_ROUTE: (_) => JobInfoPage(),
        routes.APPLICATIONS_ROUTE: (_) => ApplicationPage(),
      },
      onUnknownRoute: (routeSettings) {
        return MaterialPageRoute(builder: (_) => HomePage());
      },
    );
  }
}
