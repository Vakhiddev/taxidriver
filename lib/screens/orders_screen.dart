import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxidriver/custom_widgets/order_box.dart';
import 'package:taxidriver/custom_widgets/text_container.dart';
import 'package:taxidriver/screens/one_order_screen.dart';
import 'package:taxidriver/theme/colors.dart';

import '../custom_widgets/back_button.dart';
import '../demo_data/all_data.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 17, right: 20),
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
              Row(
                children: [
                  const TextContainer(
                    "Мои заказы",
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                  ),
                  const Spacer(),
                  SvgPicture.asset("assets/icons/filter.svg",
                  color: Theme.of(context).customColor.mainTextColor,),
                ],
              ),
              const SizedBox(height: 27),
              ...List.generate(orders.length, (index) {
                OrderInfo order = orders[index];
                return orderBox(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            OneOrderScreen(order: orders[index]),
                      ),
                    );
                  },
                  order: order,
                );
              }),
            ],
          ),
        ),
      ),
    ));
  }
}
