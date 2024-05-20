import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxidriver/custom_widgets/text_container.dart';
import 'package:taxidriver/demo_data/all_data.dart';
import 'package:taxidriver/screens/add_card_screen.dart';
import '../cubit/active_button_cubit.dart';
import '../custom_widgets/back_button.dart';
import '../custom_widgets/container_textfield.dart';
import '../main.dart';

class MyCardsScreen extends StatelessWidget {
  const MyCardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ButtonCubit()..fetchCards(),
      child: SafeArea(
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
                        "Мои карты",
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                      ),
                      const Spacer(),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AddCardScreen()));
                          },
                          child: SvgPicture.asset("assets/icons/add.svg")),
                    ],
                  ),
                  const SizedBox(height: 35),
                  BlocBuilder<ButtonCubit, ButtonState>(
                    builder: (context, state) {
                      return Column(
                        children: List.generate(state.cards.length, (index) {
                          return
                              cardView(card: state.cards[index]);

                        }),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget cardView({required CardInfo card}) {
    return Container(
      margin: EdgeInsets.only(bottom: 22),
      padding:
      const EdgeInsets.only(left: 23, right: 23, top: 22.5, bottom: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color(0xFF23262B),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset("assets/icons/uzcard.svg"),
              const SizedBox(width: 19),
              TextContainer(
                formatCardNumber((card.cardNumber).toString()),
                fontWeight: FontWeight.w700,
                fontSize: 23,
              ),
            ],
          ),
          const SizedBox(height: 23),
          Row(
            children: [
              cardDateAndNumber(isDateOrNumber: true, card: card),
              const Spacer(),
              cardDateAndNumber(isDateOrNumber: false, card: card),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 21),
          Row(
            children: [
              TextContainer(
                card.ownerFio,
                fontWeight: FontWeight.w700,
                fontSize: 19,
              ),
              const Spacer(),
              SvgPicture.asset("assets/icons/edit.svg"),
            ],
          )
        ],
      ),
    );
  }

  String dateFormat(DateTime input) {
    String month = input.month.toString().padLeft(2, '0');
    String year = input.year.toString().substring(2);

    return '$month/$year';
  }

  Widget cardDateAndNumber(
      {required bool isDateOrNumber, required CardInfo card}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextContainer(
          isDateOrNumber ? "месяц/год" : "номер телефона",
          fontWeight: FontWeight.w600,
          fontSize: 13,
        ),
        const SizedBox(height: 5),
        TextContainer(
          isDateOrNumber ? dateFormat(card.dueDate) : card.phoneNumber,
          textColor: const Color(0xFFADADAD),
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
      ],
    );
  }
}
