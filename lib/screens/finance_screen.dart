import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxidriver/custom_widgets/menu_button.dart';
import 'package:taxidriver/custom_widgets/order_box.dart';
import 'package:taxidriver/custom_widgets/text_container.dart';
import 'package:taxidriver/demo_data/all_data.dart';
import 'package:taxidriver/screens/my_cards.dart';
import 'package:taxidriver/screens/my_income.dart';
import '../custom_widgets/back_button.dart';

class FinanceScreen extends StatelessWidget {
  const FinanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 13),
              backButton(
                  height: height,
                  width: width,
                  onTap: () {
                    Navigator.pop(context);
                  }),
              const SizedBox(height: 27),
              const TextContainer(
                "Финансы",
                fontWeight: FontWeight.w700,
                fontSize: 30,
              ),
              const SizedBox(height: 27),
              Container(
                padding: const EdgeInsets.only(
                    top: 11, bottom: 13, right: 13, left: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xFF23262B),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset("assets/icons/info.svg"),
                    Row(
                      children: [
                       const Padding(
                          padding: EdgeInsets.only(top: 13),
                          child: TextContainer(
                            "Баланс, UZS",
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                        const Spacer(),
                        TextContainer(
                          formatCurrency(myCard.balance),
                          fontWeight: FontWeight.w700,
                          fontSize: 45,
                        ),
                      ],
                    ),
                    const SizedBox(height: 11),
                    Row(
                      children: [
                        cashWidget(isDeposit: false, onPressed: () {}),
                        const SizedBox(width: 13),
                        cashWidget(isDeposit: true, onPressed: () {}),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              MainButton(title: "Мой доход", onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const MyIncomeScreen(),
                  ),
                );
              }),
              MainButton(title: "Списания и начисления", onPressed: (){}),
              MainButton(title: "Мои карты", onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MyCardsScreen()));
              },),

            ],
          ),
        ),
      ),
    ));
  }

  Widget cashWidget({VoidCallback? onPressed, required bool isDeposit}) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: Container(
            height: 47,
            padding: const EdgeInsets.only(left: 11),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                width: 1,
                color: isDeposit ? Colors.white : const Color(0xFFFFD600),
              ),
            ),
            child: Row(
              children: [
                SvgPicture.asset(isDeposit
                    ? "assets/icons/wallet.svg"
                    : "assets/icons/wallet_yellow.svg"),
                const Spacer(),
                TextContainer(
                  isDeposit ? "Пополнить" : "Вывести",
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  textColor: isDeposit ? Colors.white : const Color(0xFFFFD600),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
