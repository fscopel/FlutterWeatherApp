import 'package:flutter_test/flutter_test.dart';
import 'package:sandbox/src/app.dart';
import 'package:get_it/get_it.dart';
import 'package:sandbox/src/models/currentWeather.dart';
import 'package:sandbox/src/weatherService.dart';
import 'package:mockito/mockito.dart';

void main() {
  setUpAll(() {
    GetIt.I.registerFactory<WeatherService>(() => FakeWeatherService());
    //GetIt.I.registerFactory<WeatherService>(() => WeatherService());
  });

  testWidgets('Test App Widget', (WidgetTester tester) async {
    await tester.pumpWidget(App());
    await tester.pumpAndSettle();

    expect(find.text('74.00 F'), findsOneWidget);
  });
}

class FakeWeatherService extends Fake implements WeatherService {
  @override
  Future<CurrentWeather> getWeatherByZipCode(String zipCode) {
    final currentWeather = CurrentWeather();
    currentWeather.main = Main(temp: 74);

    return Future<CurrentWeather>(() => currentWeather);
  }
}

class MockWeatherService extends Mock implements WeatherService {}
