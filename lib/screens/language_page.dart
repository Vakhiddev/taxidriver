import 'package:flutter/material.dart';
import 'package:taxidriver/main.dart';
import 'package:taxidriver/screens/auth_screen.dart';

import '../custom_widgets/back_button.dart';
import '../custom_widgets/text_container.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                backButton(
                    height: screenHeight,
                    width: screenWidth,
                    onTap: () {
                      Navigator.pop(context);
                    }),
                SizedBox(height: screenHeight * 0.12),
                const TextContainer(
                  "Выберите язык",
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: screenHeight * 0.012),
                const TextContainer(
                  "Пожалуйста, выберите язык\nинтерфейса для приложения",
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(height: screenHeight * 0.025),
                languageButton(
                    title: "Русский язык",
                    image: "assets/images/flag_ru.png",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AuthScreen(),
                        ),
                      );
                    }),
                languageButton(
                    title: "O'zbek tili",
                    image: "assets/images/uzbek_flag.png",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AuthScreen(),
                        ),
                      );
                    }),
                languageButton(
                    title: "English",
                    image: "assets/images/flag_eng.png",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AuthScreen(),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget languageButton(
    {required String title, required String image, VoidCallback? onPressed}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: MaterialButton(
      color: const Color.fromRGBO(40, 45, 53, 1),
      height: 60,
      minWidth: double.infinity,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 40,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextContainer(title),
          )
        ],
      ),
    ),
  );
}
