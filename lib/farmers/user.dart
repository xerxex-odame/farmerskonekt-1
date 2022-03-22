// import 'dart:js';

// import 'package:flutter/material.dart';
// import 'package:weather/weather.dart';

// enum AppState { NOT_DOWNLOADED, DOWNLOADING, FINISHED_DOWNLOADING }

// class Weather extends StatefulWidget {
//   const Weather({ Key? key }) : super(key: key);

//   @override
//   State<Weather> createState() => _WeatherState();
// }


// _WeatherState() {
// }
// late WeatherFactory ws;
//   List<Weather> _data = [];
//   AppState _state = AppState.NOT_DOWNLOADED;
//   double? lat, lon;

//   @override
//   void initState() {
//     String key;
//     ws = WeatherFactory(key);
//   }

//   void queryForecast() async {
//     /// Removes keyboard
//     FocusScope.of(context).requestFocus(FocusNode());
//     setState(() {
//       _state = AppState.DOWNLOADING;
//     });

//     List<Weather> forecasts = (await ws.fiveDayForecastByLocation(lat!, lon!)).cast<Weather>();
//     setState(() {
//       _data = forecasts;
//       _state = AppState.FINISHED_DOWNLOADING;
//     });
//   }

// void setState(Null Function() param0) {
// }

//   void queryWeather() async {
//     /// Removes keyboard
//     FocusScope.of(context).requestFocus(FocusNode());

//     setState(() {
//       _state = AppState.DOWNLOADING;
//     });

//     Weather weather = (await ws.currentWeatherByLocation(lat!, lon!)) as Weather;
//     setState(() {
//       _data = [weather];
//       _state = AppState.FINISHED_DOWNLOADING;
//     });
//   }

//   Widget contentFinishedDownload() {
//     return Center(
//       child: ListView.separated(
//         itemCount: _data.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(_data[index].toString()),
//           );
//         },
//         separatorBuilder: (context, index) {
//           return Divider();
//         },
//       ),
//     );
//   }

//   Widget contentDownloading() {
//     return Container(
//       margin: EdgeInsets.all(25),
//       child: Column(children: [
//         Text(
//           'Fetching Weather...',
//           style: TextStyle(fontSize: 20),
//         ),
//         Container(
//             margin: EdgeInsets.only(top: 50),
//             child: Center(child: CircularProgressIndicator(strokeWidth: 10)))
//       ]),
//     );
//   }

//   Widget contentNotDownloaded() {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Text(
//             'Press the button to download the Weather forecast',
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _resultView() => _state == AppState.FINISHED_DOWNLOADING
//       ? contentFinishedDownload()
//       : _state == AppState.DOWNLOADING
//           ? contentDownloading()
//           : contentNotDownloaded();

//   void _saveLat(String input) {
//     lat = double.tryParse(input);
//     print(lat);
//   }

//   void _saveLon(String input) {
//     lon = double.tryParse(input);
//     print(lon);
//   }

//   Widget _coordinateInputs() {
//     return Row(
//       children: <Widget>[
//         Expanded(
//           child: Container(
//               margin: EdgeInsets.all(5),
//               child: TextField(
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(), hintText: 'Enter latitude'),
//                   keyboardType: TextInputType.number,
//                   onChanged: _saveLat,
//                   onSubmitted: _saveLat)),
//         ),
//         Expanded(
//             child: Container(
//                 margin: EdgeInsets.all(5),
//                 child: TextField(
//                     decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         hintText: 'Enter longitude'),
//                     keyboardType: TextInputType.number,
//                     onChanged: _saveLon,
//                     onSubmitted: _saveLon)))
//       ],
//     );
//   }

//   Widget _buttons() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Container(
//           margin: EdgeInsets.all(5),
//           child: TextButton(
//             child: Text(
//               'Fetch weather',
//               style: TextStyle(color: Colors.white),
//             ),
//             onPressed: queryWeather,
//             style: ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all(Colors.blue)),
//           ),
//         ),
//         Container(
//           margin: EdgeInsets.all(5),
//           child: TextButton(
//             child: Text(
//               'Fetch forecast',
//               style: TextStyle(color: Colors.white),
//             ),
//             onPressed: queryForecast,
//             style: ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all(Colors.blue)),
//           ),
//         )
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Weather Example App'),
//         ),
//         body: Column(
//           children: <Widget>[
//             _coordinateInputs(),
//             _buttons(),
//             Text(
//               'Output:',
//               style: TextStyle(fontSize: 20),
//             ),
//             Divider(
//               height: 20.0,
//               thickness: 2.0,
//             ),
//             Expanded(child: _resultView())
//           ],
//         ),
//       ),
//     );
//   }

// // // Import the firebase_core and cloud_firestore plugin
// // //import 'package:firebase_core/firebase_core.dart';

// // class AddUser extends StatelessWidget {
// //   final String firstName;
// //   final String lastName;
// //   final int dateOfBirth;
// //   final String region;
// //   final String location;
// //   final String country;
// //   final String district;
// //   final String phoneNumber;
// //   final String gender;
// //   final int farmLand;
// //   final String accountType;
// //   final String landSize;

// //   AddUser(
// //     this.firstName,
// //     this.lastName,
// //     this.dateOfBirth,
// //     this.location,
// //     this.region,
// //     this.country,
// //     this.phoneNumber,
// //     this.gender,
// //     this.accountType,
// //     this.farmLand,
// //     this.district,
// //     this.landSize,
// //   );

// //   @override
// //   Widget build(BuildContext context) {
// //     // Create a CollectionReference called users that references the firestore collection
// //     CollectionReference users = FirebaseFirestore.instance.collection('users');

// //     Future<void> addUser() {
// //       // Call the user's CollectionReference to add a new user
// //       return users
// //           .add({
// //             'firstName': firstName, // John Doe
// //             'lastName': lastName, // Stokes and Sons
// //             'dateOfBirth': dateOfBirth, // 42
// //             'gender': gender,
// //             'district': 'district',
// //             'phoneNumber': 'phoneNumber',
// //             'region': 'region',
// //             'location': 'location',
// //             'country': 'country',
// //             'landSize': 'landSize',
// //             'farmLand': 'farmLand',
// //             'accountType': 'accountType',
// //           })
// //           .then((value) => print("User Added"))
// //           .catchError((error) => print("Failed to add user: $error"));
// //     }

// //     return TextButton(
// //       onPressed: addUser,
// //       child: Text(
// //         "Add User",
// //       ),
// //     );
// //   }
// // }
