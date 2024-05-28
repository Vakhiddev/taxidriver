import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taxidriver/custom_widgets/settings_button.dart';
import 'package:taxidriver/custom_widgets/text_container.dart';
import 'package:taxidriver/screens/language_page.dart';
import 'package:taxidriver/screens/settings_language.dart';
import '../custom_widgets/back_button.dart';
import '../main.dart';
import '../theme/theme_notifier.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    bool isLightTheme = Theme.of(context).brightness != Brightness.light;
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
                  isOn: isLightTheme,
                    buttonType: ButtonType.switchB, title: "Включить ночной режим",
                onChanged: (value){
                    setState(() {
                      isLightTheme = value;
                    });
                    Provider.of<ThemeNotifier>(context, listen: false).toggleTheme();

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

