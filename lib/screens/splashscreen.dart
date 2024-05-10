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
                        image: AssetImage('assets/images/appIcon.png'))),
              ),
              const SizedBox(
                height: 18,
              ),
              Text('DAVR TAXI',
                  style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                          fontSize: 29,
                          fontWeight: FontWeight.w800,
                          fontStyle: FontStyle.normal,
                          color: Colors.white))),
              Text('Онлайн служба такси',
                  style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                          fontSize: 15,
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
