import 'package:flutter/material.dart';
import 'package:taxidriver/screens/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xff1E2127),
          appBarTheme: const AppBarTheme(backgroundColor: Color(0xff1E2127))),
      home: const SplashScreen(),
    );
  }
}
