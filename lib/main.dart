import 'package:flutter/material.dart';
import 'package:flutter_application_1/splash/splashScreen.dart';
import './nav/bottnav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        '/home': (context) => const MyCustomNavBar(),
      },
    );
  }
}
