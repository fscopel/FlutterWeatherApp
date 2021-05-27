import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:sandbox/src/models/currentWeather.dart';
import 'package:sandbox/src/weatherService.dart';


class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  CurrentWeather _currentWeather;
  final weatherService = GetIt.instance<WeatherService>();

  @override
  void initState() {
    super.initState();
    weatherService.getWeatherByZipCode('75093').then((value) => {
          setState(() {
            _currentWeather = value;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
              child: _currentWeather != null
                  ? Text('${_currentWeather.main.temp.toStringAsFixed(2)} F',
                      style: TextStyle(
                          fontSize: 26, fontWeight: FontWeight.normal))
                  : Icon(Icons.cloud_circle))),
    );
  }
}
