// import 'package:weather/weather.dart';

// import 'location.dart';
// class ForecastService {
//   final WeatherApi weatherApi;
//   ForecastService(this.weatherApi);

//   Future<Forecast> getWeather(String city) async {
//     final location = await weatherApi.getLocation(city);
//     return await weatherApi.getWeather(location);
//   }
// }

// class Forecast {
//   final DateTime lastUpdated;
//   final double longitude;
//   final double latitude;
//   final List<Weather> daily;
//   final Weather current;
//   final bool isDayTime;
//   String city;

//   Forecast(
//       {required this.lastUpdated,
//       required this.longitude,
//       required this.latitude,
//       this.daily: const [],
//       required this.current,
//       required this.city,
//       required this.isDayTime});

//   static get currentForcast => null;

//   static Forecast fromJson(dynamic json) {
//     var weather = json['current']['weather'][0];
//     var date = DateTime.fromMillisecondsSinceEpoch(json['current']['dt'] * 1000,
//         isUtc: true);

//     var sunrise = DateTime.fromMillisecondsSinceEpoch(
//         json['current']['sunrise'] * 1000,
//         isUtc: true);

//     var sunset = DateTime.fromMillisecondsSinceEpoch(
//         json['current']['sunset'] * 1000,
//         isUtc: true);

//     bool isDay = date.isAfter(sunrise) && date.isBefore(sunset);

//     // get the forecast for the next 3 days, excluding the current day
//     bool hasDaily = json['daily'] != null;
//     var tempDaily = [];
//     if (hasDaily) {
//       List items = json['daily'];
//       tempDaily = items
//           .map((item) => Weather(item))
//           .toList()
//           .skip(1)
//           .take(3)
//           .toList();
//     }

    

//     return Forecast(
//         lastUpdated: DateTime.now(),
//         current: currentForcast,
//         latitude: json['lat'].toDouble(),
//         longitude: json['lon'].toDouble(),
//         isDayTime: isDay, city: '');
//   }
// }