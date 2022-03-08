// import 'package:farmers_konekt/farmers/das.dart';
import 'package:farmers_konekt/farmers/das.dart';
import 'package:farmers_konekt/farmers/requests.dart';
import 'package:farmers_konekt/farmers/sign_upp.dart';
import 'package:farmers_konekt/firebase_options.dart';
import 'package:farmers_konekt/homeview/login.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:farmers_konekt/homeview/login.dart';
import 'package:flutter/material.dart';
//import 'package:device_preview/device_preview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
// void main() => runApp(
//       // DevicePreview(
//       //   enabled: true,
//       //   builder: (context) => MyApp(), // Wrap your app
//       // ),
//     );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      // theme: ThemeData.light(),
      // darkTheme: ThemeData.dark(),
      //useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      home: Requests(),
    );
  }
}
