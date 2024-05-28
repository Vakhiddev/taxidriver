import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taxidriver/main.dart';
import 'package:taxidriver/screens/auth_screen.dart';
import 'package:taxidriver/theme/colors.dart';

import '../custom_widgets/back_button.dart';
import '../custom_widgets/text_container.dart';
import '../theme/theme_notifier.dart';

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
                      // Navigator.pop(context);
                    }),
                SizedBox(height: screenHeight * 0.12),
                 TextContainer(
                  "Выберите язык",
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  textColor: Theme.of(context).customColor.mainTextColor,
                ),
                SizedBox(height: screenHeight * 0.012),
                 TextContainer(
                  "Пожалуйста, выберите язык\nинтерфейса для приложения",
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  textColor: Theme.of(context).customColor.mainTextColor,
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
  return Builder(
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: MaterialButton(
          color: Theme.of(context).customColor.languageButtonColor,
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
                child: TextContainer(title,
                  textColor: Theme.of(context).customColor.mainTextColor,
                ),
              )
            ],
          ),
        ),
      );
    }
  );
}
