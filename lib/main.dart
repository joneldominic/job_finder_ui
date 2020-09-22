import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './job_finder_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) => runApp(JobFinderApp()));
}
