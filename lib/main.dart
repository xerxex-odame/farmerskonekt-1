import 'package:farmers_konekt/farmers/continue.dart';
import 'package:farmers_konekt/farmers/das.dart';
import 'package:farmers_konekt/farmers/newmap.dart';
import 'package:farmers_konekt/farmers/re_register.dart';
import 'package:farmers_konekt/farmers/requests.dart';
import 'package:farmers_konekt/fbo/user_dash.dart';
import 'package:farmers_konekt/firebase_options.dart';
import 'package:farmers_konekt/hive_service.dart';
import 'package:farmers_konekt/homeview/login.dart';
import 'package:farmers_konekt/new.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
//import 'package:farmers_konekt/homeview/login.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:flutter/material.dart';

import 'note.dart';
import 'package:provider/provider.dart';
//import 'package:device_preview/device_preview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
      // (MultiProvider(providers: [
      // ChangeNotifierProvider<CityEntryViewModel>(
      //     create: (_) => CityEntryViewModel()),
      // ChangeNotifierProvider<ForecastViewModel>(
      //     create: (_) => ForecastViewModel()),
      ListenableProvider(
          create: (context) => HiveService(), child: const MyApp()));
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
    Widget example1 = SplashScreenView(
      navigateRoute: Dash(),
      duration: 5000,
      imageSize: 130,
      imageSrc: "assets/farmers.png",
      text: "Splash Screen",
      textType: TextType.ColorizeAnimationText,
      textStyle: TextStyle(
        fontSize: 40.0,
      ),
      colors: [
        Colors.purple,
        Colors.blue,
        Colors.yellow,
        Colors.red,
      ],
      backgroundColor: Colors.white,
    );

    return MaterialApp(
      // useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      // theme: ThemeData.light(),sssss
      // darkTheme: ThemeData.dark(),
      //useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      home: Requests(),
    );
  }
}
