import 'package:flutter/material.dart';
import 'package:taxidriver/custom_widgets/text_container.dart';
import 'package:taxidriver/screens/language_page.dart';
import '../custom_widgets/back_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                backButton(
                    height: screenHeight,
                    width: screenWidth,
                    onTap: () {
                      Navigator.pop(context);
                    }),
                const SizedBox(height: 27),
                const TextContainer(
                  "Настройки",
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                ),
                const SizedBox(height: 27),

              ],
            ),
          ),
        ));
  }
}

