import 'package:flutter/material.dart';
import 'package:taxidriver/custom_widgets/back_button.dart';
import 'package:taxidriver/custom_widgets/container_textfield.dart';
import 'package:taxidriver/custom_widgets/document_box.dart';
import 'package:taxidriver/custom_widgets/text_container.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool isLightTheme = Theme.of(context).brightness == Brightness.light;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 16),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 2),
                child: backButton(
                    height: height,
                    width: width,
                    onTap: () {
                      Navigator.pop(context);
                    }),
              ),
              const SizedBox(height: 27),
              const Padding(
                padding: EdgeInsets.only(left: 2),
                child: TextContainer(
                  "Мой профиль",
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 27),
              CustomTextField(
                color: isLightTheme ? Colors.white : null,
                inputType: InputType.simple,
                hintText: "Пономарев Дмитрий Сергеевич",
                controller: controller,
              ),
              const SizedBox(height: 15),
              CustomTextField(
                color: isLightTheme ? Colors.white : null,
                inputType: InputType.simple,
                hintText: "Jaguar XGL",
                controller: controller2,
              ),
              const SizedBox(height: 15),
              CustomTextField(
                color: isLightTheme ? Colors.white : null,
                inputType: InputType.simple,
                hintText: "01 S 602 BL",
                controller: controller3,
              ),
              const SizedBox(height: 15),
              CustomTextField(
                color: isLightTheme ? Colors.white : null,
                inputType: InputType.simple,
                hintText: "Белый",
                controller: controller4,
              ),
              const SizedBox(height: 15),
              documentWidget(imagePath: "assets/images/id1.png"),
              const SizedBox(height: 15),
              documentWidget(imagePath: "assets/images/id2.png"),

            ],
          ),
        ),
      ),
    );
  }
}
