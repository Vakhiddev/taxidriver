import 'package:flutter/material.dart';
import 'package:taxidriver/screens/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    screenHeight = height;
    double width = MediaQuery.of(context).size.width;
    screenWidth = width;
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xff1E2127),
          appBarTheme: const AppBarTheme(backgroundColor: Color(0xff1E2127))),
      home: const SplashScreen(),
    );
  }
}

late double screenWidth;
late double screenHeight;
