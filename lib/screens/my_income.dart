import 'package:flutter/material.dart';
import 'package:taxidriver/custom_widgets/order_box.dart';
import 'package:taxidriver/custom_widgets/text_container.dart';
import 'package:taxidriver/demo_data/all_data.dart';
import 'package:taxidriver/screens/language_page.dart';
import '../custom_widgets/back_button.dart';
import '../main.dart';

class MyIncomeScreen extends StatelessWidget {
  const MyIncomeScreen({super.key});

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
              const TextContainer(
                "Мой доход",
                fontWeight: FontWeight.w700,
                fontSize: 30,
              ),
              const SizedBox(height: 35),
              ...List.generate(spends.length, (index) {
                return spendContainer(
                  spend: spends[index],
                );
              }),
            ],
          ),
        ),
      ),
    ));
  }

  Widget spendContainer({required MonthlySpends spend}) {
    return Container(
      height: 75,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.only(left: 23, right: 19),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color(0xFF23262B),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextContainer(
            spendTimeFormatter(spend.month),
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          Container(
              height: 40,
              width: screenWidth * 0.372,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xFFFFD600),
              ),
              child: Center(
                child: TextContainer("${formatCurrency(spend.spend)} uzs",
                textColor: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,),
              ),
          )
        ],
      ),
    );
  }

  String spendTimeFormatter(DateTime input) {
    final months = [
      'Январь',
      'Февраль',
      'Март',
      'Апрель',
      'Май',
      'Июнь',
      'Июль',
      'Август',
      'Сентябрь',
      'Октябрь',
      'Ноябрь',
      'Декабрь'
    ];

    String month = months[input.month - 1];
    String year = input.year.toString();

    return '$month, $year';
  }
}
