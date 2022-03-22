// import 'forecast.dart';

// abstract class WeatherApi {
//   Future<Forecast> getWeather(Location location);
//   Future<Location> getLocation(String city);
// }
// class Location {
//   final double longitude;
//   final double latitude;

//   Location({
//     required this.longitude,
//     required this.latitude,
//   });

//   static Location fromJson(dynamic json) {
//     return Location(
//         longitude: json['coord']['lon'].toDouble(),
//         latitude: json['coord']['lat'].toDouble());
//   }
// }