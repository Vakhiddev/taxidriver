import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxidriver/custom_widgets/order_box.dart';
import 'package:taxidriver/custom_widgets/text_container.dart';
import 'package:taxidriver/demo_data/all_data.dart';
import 'package:taxidriver/main.dart';
import 'package:taxidriver/theme/colors.dart';

import '../custom_widgets/back_button.dart';

class OneOrderScreen extends StatelessWidget {
  final OrderInfo order;
  const OneOrderScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
         body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 13),
        child: ListView(
          children: [
            backButton(
                height: height,
                width: width,
                onTap: () {
                  Navigator.pop(context);
                }),
            const SizedBox(height: 27),
            TextContainer(
              formatTime(order.completedTime),
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
            const SizedBox(height: 47),
            Row(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: const Color(0xFFF9AD42), width: 1),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(order.clientAvatar),
                          fit: BoxFit.cover)),
                ),
                const SizedBox(width: 14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextContainer(
                      order.clientName,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    Row(
                      children: [
                        TextContainer(
                          rateFormat(order.rate),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        const SizedBox(width: 7),
                        SvgPicture.asset("assets/icons/star.svg")
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextContainer(
                      "${formatCurrency(order.totalPrice)} uzs",
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(height: 4),
                    TextContainer(
                      "${order.distance} km",
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
             Divider(
              color: Theme.of(context).customColor.mainTextColor.withOpacity(0.5),
              thickness: 1,
            ),
            const SizedBox(height: 21),
            locationRow(startPoint: true, order: order),
            const SizedBox(height: 17),
             Divider(
              color: Theme.of(context).customColor.mainTextColor.withOpacity(0.5),
              thickness: 1,
              indent: 29,
              endIndent: 2,
            ),
            const SizedBox(height: 10),
            locationRow(startPoint: false, order: order),
            const SizedBox(height: 24),
            Row(
              children: [
                infoBox(order: order, isPay: true, width: width),
                const Spacer(),
                infoBox(order: order, isPay: false, width: width),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, bottom: 15, top: 11),
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).customColor.textFieldColor,
                  border: Border.all(width: 1,color: Theme.of(context).customColor.borderColor)
              ),
              child: TextContainer(order.warning,
              fontSize: 15),
            ),
            const SizedBox(height: 24),
            checkColumn(order)
          ],
        ),
              ),
            ));
  }

}

Column textColumn(OrderInfo order, bool isPrice){
  return Column(
    crossAxisAlignment: isPrice ? CrossAxisAlignment.end : CrossAxisAlignment.start,
    children: [
      TextContainer( isPrice ?
      "${formatCurrency(order.orderPrice)} UZS"
          : "Цена заказа",
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
      const SizedBox(height: 3),
      TextContainer( isPrice ?
      "${formatCurrency(order.waitingPrice)} UZS"
          : "Ожидание",
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
      const SizedBox(height: 3),
      TextContainer( isPrice ?
      "${formatCurrency(order.totalPrice)} UZS"
          : "Итого",
        fontSize: 15,
        fontWeight: FontWeight.w700,
      ),
    ],
  );
}

Text underlineCount(double width) {
  int count = width ~/ 6;
  String output = '';
  for (int i = 0; i < count; i += 8) {
    output += '----------';
  }
  return Text(
    output,
    maxLines: 1,overflow: TextOverflow.clip,
    );
}

Column checkColumn(OrderInfo order,){
  return Column(
    children: [
      underlineCount(screenWidth),
      const SizedBox(height: 16),
      Row(
        children: [
          textColumn(order, false),
          const Spacer(),
          textColumn(order, true),
        ],
      ),
      const SizedBox(height: 16),
      underlineCount(screenWidth),

    ],
  );
}
Widget locationRow({required bool startPoint, required OrderInfo order}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          SvgPicture.asset(
            "assets/icons/start_point.svg",
            color: startPoint ? null : const Color(0xFFFFD600),
          ),
          const SizedBox(width: 14),
          TextContainer(
            startPoint ? order.startedAddress : order.finishedAddress,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(left: 29),
        child: TextContainer(
          startPoint ? "Откуда" : "Куда",
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
      ),
    ],
  );
}

String rateFormat(double value) {
  String formattedValue = value.toStringAsFixed(2);
  formattedValue = formattedValue.replaceAll('.', ',');
  return formattedValue;
}

Widget infoBox(
    {required OrderInfo order, required bool isPay, required double width}) {
  return Builder(
    builder: (context) {
      return Container(
        width: width * 0.45,
        height: 49,
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 9),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).customColor.textFieldColor,
          border: Border.all(width: 1,color: Theme.of(context).customColor.borderColor)
        ),
        child: Row(
          children: [
            SvgPicture.asset(isPay
                ? order.typePay
                ? "assets/icons/wallet.svg"
                : "assets/icons/uzcard.svg"
                : "assets/icons/coller.svg",width: 22,height: 22,),
            const SizedBox(width: 9),
            Expanded(
              child: TextContainer(
                isPay
                    ? order.typePay
                    ? "Hаличный "
                    : "Оплата картой"
                    : "Кондиционер",
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            )
          ],
        ),
      );
    }
  );
}