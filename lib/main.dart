import 'package:flutter/material.dart';
import 'package:wigcity/screens/login_screen.dart';
import 'package:wigcity/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WigCity',
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => LoginScreen(),
      },
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xff4a0d67),
        accentColor: const Color(0xff89023E),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}

