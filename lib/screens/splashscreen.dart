import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxidriver/screens/onboardingscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => OnboardingScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 156,
                height: 156,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(38),
                    color: Color(0xFF27282A),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/splash_logo.png'))),
              ),
              const SizedBox(
                height: 18,
              ),
              Text('GARAGE',
                  style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                          fontSize: 33,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          color: Colors.white))),
              Text('Онлайн заказ такси',
                  style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.normal,
                          color: Color(0xffFFFFFF)))),
            ],
          ),
        ),
      ),
    );
  }
}
