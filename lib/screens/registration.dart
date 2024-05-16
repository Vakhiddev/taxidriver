import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxidriver/custom_widgets/container_button.dart';
import 'package:taxidriver/custom_widgets/container_textfield.dart';
import 'package:taxidriver/custom_widgets/text_container.dart';
import 'package:taxidriver/screens/home_screen.dart';
import '../custom_widgets/back_button.dart';
import '../custom_widgets/bottom_sheet.dart';
import '../main.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 23,right: 23, top: 13,bottom: 25),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            backButton(
                height: screenHeight,
                width: screenWidth,
                onTap: () {
                  Navigator.pop(context);
                }),
            const SizedBox(height: 32),
            const TextContainer(
              "Регистрация",
              fontWeight: FontWeight.w700,
              fontSize: 30,
            ),
            const SizedBox(height: 7),
            const TextContainer(
              """Пожалуйста, заполните анкету, после проверки и одобрения - Вы получите SMS-сообщение""",
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
            const SizedBox(height: 25),
            CustomTextField(
              hintText: "Ваше ФИО",
              controller: controller,
              inputType: InputType.simple,
            ),
            const SizedBox(height: 15),
            CustomTextField(
              hintText: "Марка и модель вашего авто",
              controller: controller2,
              inputType: InputType.simple,
            ),
            const SizedBox(height: 15),
            CustomTextField(
              hintText: "Гос.номер вашего авто",
              controller: controller3,
              inputType: InputType.simple,
            ),
            const SizedBox(height: 15),
            CustomTextField(
              hintText: "Цвет вашего авто",
              controller: controller4,
              inputType: InputType.simple,
            ),
            const SizedBox(height: 15),
            getPicture(title: "Фото водительского удост-я"),
            const SizedBox(height: 15),
            getPicture(title: "Фото Техпаспорта "),
            const SizedBox(height: 37),
            buttonContainer(
                text: "Отправить заявку",
                containerColor: const Color(0xFFFFD600),
                textColor: Colors.black,
              onTap: (){
                   showButtonSheet(context,(){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  },Color(0xFF2C313A).withOpacity(0.8));
              }
            )
          ],
        ),
      ),
    ));
  }

  Widget getPicture({required String title}) {
    return Container(
      height: 60,
      padding: const EdgeInsets.only(left: 22,right: 20),
      decoration: BoxDecoration(
          color: const Color(0xFF26282D),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          TextContainer(
            title,
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
          const Spacer(),
          SvgPicture.asset("assets/icons/upload.svg"),
        ],
      ),
    );
  }
}
