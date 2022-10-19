import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_challenger/app_widget.dart';
import 'package:flutter_challenger/core/di/di.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const FlutterChallenger());
}
