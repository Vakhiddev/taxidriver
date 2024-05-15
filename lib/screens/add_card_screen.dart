import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxidriver/custom_widgets/container_button.dart';
import 'package:taxidriver/custom_widgets/container_textfield.dart';
import 'package:taxidriver/custom_widgets/text_container.dart';
import '../custom_widgets/back_button.dart';
import '../main.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

TextEditingController numberController = TextEditingController();
TextEditingController dateController = TextEditingController();
TextEditingController phoneNumberController = TextEditingController();

class _AddCardScreenState extends State<AddCardScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
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
              Row(
                children: [
                  const TextContainer(
                    "Добавить карту",
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                  ),
                  const Spacer(),
                  InkWell(
                      onTap: () {},
                      child: SvgPicture.asset("assets/icons/add.svg")),
                ],
              ),
              const SizedBox(height: 24),
              const TextContainer(
                "Введите номер карты",
                fontWeight: FontWeight.w300,
                fontSize: 14,
              ),
              const SizedBox(height: 9),
              CustomTextField(
                maxLength: 19,
                  height: 40,
                  controller: numberController,
                  inputType: InputType.cardNumber),
              const SizedBox(height: 14),
              Row(
                children: [
                  SizedBox(
                    width: 115,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextContainer(
                          "Срок действия",
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                        ),
                        const SizedBox(height: 9),
                        CustomTextField(
                          maxLength: 5,
                          height: 40,
                          controller: dateController,
                          inputType: InputType.dueDate,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 23),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextContainer(
                          "Номер телефона",
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                        ),
                        const SizedBox(height: 9),
                        CustomTextField(
                          maxLength: 17,
                          height: 40,
                          controller: phoneNumberController,
                          inputType: InputType.phoneNumber,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              buttonContainer(
                onTap: (){

                },
                  text: "Добавить карту",
                  height: 51,
                  containerColor: numberController.text.isNotEmpty ?
                  const Color(0xFFFFD600) : const Color(0xFF4D4D4D),
                  textColor: Colors.black,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
