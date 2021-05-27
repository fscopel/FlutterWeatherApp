import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:sandbox/src/weatherService.dart';
import 'src/app.dart';

void main() {
  GetIt.I.registerFactory<WeatherService>(() => WeatherService());
  runApp(App());
}
