import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxidriver/custom_widgets/container_button.dart';
import 'package:taxidriver/custom_widgets/container_textfield.dart';
import 'package:taxidriver/custom_widgets/text_container.dart';
import '../cubit/active_button_cubit.dart';
import '../custom_widgets/back_button.dart';
import '../main.dart';

class AddCardScreen extends StatelessWidget {
  const AddCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ButtonCubit(),
      child: AddCardView(),
    );
  }
}

class AddCardView extends StatefulWidget {
  const AddCardView({super.key});

  @override
  State<AddCardView> createState() => _AddCardViewState();
}

TextEditingController numberController = TextEditingController();
TextEditingController dateController = TextEditingController();
TextEditingController phoneNumberController = TextEditingController();

class _AddCardViewState extends State<AddCardView> {
  @override
  void initState() {
    super.initState();

    numberController.addListener(_updateButtonState);
    dateController.addListener(_updateButtonState);
    phoneNumberController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    context.read<ButtonCubit>().updateButtonState(
      numberController,
      dateController,
      phoneNumberController,
    );
  }

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
                        width: screenWidth * 0.2769,
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
                  BlocBuilder<ButtonCubit, ButtonState>(
                    builder: (context, state) {
                      return buttonContainer(
                        onTap: state.isEnabled
                            ? () async{
                          context.read<ButtonCubit>().addNewCardToCards(
                            numberController,
                            dateController,
                            phoneNumberController,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Card Added")));
                          await Future.delayed(Duration(seconds: 2));
                          phoneNumberController.clear();
                          dateController.clear();
                          numberController.clear();
                           Navigator.pop(context,true);
                                }
                            : null,
                        text: "Добавить карту",
                        height: 51,
                        containerColor: state.buttonColor,
                        textColor: Colors.black,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  @override
  void dispose() {
    phoneNumberController.clear();
    dateController.clear();
    numberController.clear();
    super.dispose();
  }
}
