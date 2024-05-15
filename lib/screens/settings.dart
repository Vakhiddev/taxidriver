import 'package:flutter/material.dart';
import 'package:taxidriver/custom_widgets/settings_button.dart';
import 'package:taxidriver/custom_widgets/text_container.dart';
import 'package:taxidriver/screens/language_page.dart';
import 'package:taxidriver/screens/settings_language.dart';
import '../custom_widgets/back_button.dart';
import '../main.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isOn = true;
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
                settingsButton(
                  isOn: isOn,
                    buttonType: ButtonType.switchB, title: "Включить ночной режим",
                onChanged: (value){
                    setState(() {
                      isOn = value;
                    });
                }),
                const SizedBox(height: 9),
                settingsButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SettingsLanguagesScreen()));
                  },
                    buttonType: ButtonType.simpleB,
                  title: "Русский язык",

                ),
              ],
            ),
          ),
        ));
  }
}

