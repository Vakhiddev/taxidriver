import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxidriver/screens/language_page.dart';

import '../custom_widgets/text_container.dart';

// import 'package:taxiapp/screens%20copy/language_page.dart';
// import 'package:taxiapp/screens%20copy/main_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  Widget dotpageview() {
    return Builder(builder: ((context) {
      return Row(
        children: [
          for (int i = 0; i < 2; i++)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              width: i == pagenumber ? 25 : 6,
              height: 6,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color:
                      i == pagenumber ? const Color(0xFF2F80ED) : Colors.white),
            )
        ],
      );
    }));
  }

  PageController nextpage = PageController(keepPage: false);
  int pagenumber = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      extendBody: true,
      body: Stack(children: [
        PageView(
          padEnds: false,
          allowImplicitScrolling: false,
          onPageChanged: (value) {
            setState(() {
              pagenumber = value;
            });
          },
          controller: nextpage,
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/Onboarding1.png'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      const Color(0xFF1e2127).withOpacity(0.8),
                      BlendMode.srcOver),
                ),
              ),
              child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(22.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const TextContainer(
                                'Работай когда удобно',
                                fontWeight: FontWeight.w700,
                                fontSize: 25,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                  'Вы можете зарабатывать в нашем сервисе на постоянной основе или в свободное от основной работы время',
                                  style: GoogleFonts.montserrat(
                                      textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.white,
                                  ))),
                              const SizedBox(
                                height: 52,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/Onboarding2.png'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      const Color(0xFF1e2127).withOpacity(0.8),
                      BlendMode.srcOver),
                ),
              ),
              child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Простой вывод денег',
                                  style: GoogleFonts.montserrat(
                                      textStyle: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w700,
                                          fontStyle: FontStyle.normal,
                                          color: Colors.white))),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                  'Оплачивая поездку онлайн, сервис дает возможность выводить с вашего баланса средства ежедневно на вашу карту Uzcard, Humo ежедневно',
                                  style: GoogleFonts.montserrat(
                                      textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.white,
                                  ))),
                              const SizedBox(
                                height: 52,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )),
            ),
          ],
        ),
        Positioned(
          right: 12,
          top: 56,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Language()));
                },
                child: const TextContainer(
                  'Пропустить',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        Positioned(
            bottom: 12,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 22.0, bottom: 18.0),
                        child: dotpageview(),
                      )
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      nextpage.animateToPage(
                        1,
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeIn,
                      );
                      if (pagenumber == 1) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Language(),
                            ));
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 22.0, bottom: 18.0),
                      child: Text('Далее',
                          style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  color: Colors.white))),
                    ),
                  )
                ],
              ),
            )),
      ]),
    );
  }
}
