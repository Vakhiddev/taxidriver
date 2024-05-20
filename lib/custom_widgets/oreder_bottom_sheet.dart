import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taxidriver/custom_widgets/animated_button.dart';
import 'package:taxidriver/custom_widgets/container_button.dart';
import 'package:taxidriver/custom_widgets/order_box.dart';
import 'package:taxidriver/custom_widgets/rate_button_sheet.dart';
import 'package:taxidriver/custom_widgets/text_container.dart';
import 'package:taxidriver/demo_data/all_data.dart';
import 'package:taxidriver/main.dart';

import '../screens/one_order_screen.dart';

enum ButtonType {
  show,
  take,
  close,
}

Future orderButtonSheet(BuildContext context, VoidCallback onPressed,
    OrderInfo order, ButtonType type) async {
  await showModalBottomSheet(
    isDismissible: true,
    context: context,
    builder: (BuildContext builderContext) {
      return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              // height: double.minPositive,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                color: Color(0xFF1F2126),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 24,
                        bottom: type == ButtonType.show ? 107 :
                    type == ButtonType.take ? 291 : 92), // Adjust this value if needed
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // const SizedBox(height: 12),
                          // const SizedBox(height: 10),
                          if (type == ButtonType.show) priceAndDistance(order: order),
                          if (type == ButtonType.take)
                            clientInfoTake(
                              order: order,
                              rightWidgets: Row(
                                children: [
                                  SvgPicture.asset("assets/icons/buttons/call.svg"),
                                  const SizedBox(width: 16),
                                  SvgPicture.asset("assets/icons/buttons/sms.svg"),
                                  const SizedBox(width: 16),
                                  SvgPicture.asset("assets/icons/buttons/share.svg")
                                ],
                              ),
                            ),
                          if (type == ButtonType.close)
                            clientInfoTake(
                              order: order,
                              rightWidgets: Column(
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
                            ),
                          SizedBox(
                              height: type == ButtonType.show
                                  ? 0
                                  : type == ButtonType.take
                                  ? 13
                                  : 16),
                          Divider(
                            color: Color(0xFFEFEFF4).withOpacity(0.2),
                            thickness: 0.5,
                            indent: type == ButtonType.show
                                ? 0
                                : type == ButtonType.take
                                ? 17
                                : 19,
                            endIndent: type == ButtonType.show
                                ? 0
                                : type == ButtonType.take
                                ? 19
                                : 22,
                          ),
                          const SizedBox(height: 18),
                          Padding(
                            padding: const EdgeInsets.only(left: 18),
                            child: locationRow(startPoint: true, order: order),
                          ),
                          SizedBox(height: type == ButtonType.show ? 18 : 10),
                          Divider(
                            color: Color(0xFFEFEFF4).withOpacity(0.2),
                            thickness: 0.5,
                            indent: type == ButtonType.show
                                ? 0
                                : type == ButtonType.take
                                ? 46
                                : 21,
                            endIndent: type == ButtonType.show
                                ? 0
                                : type == ButtonType.take
                                ? 26
                                : 21,
                          ),
                          if (type != ButtonType.show)
                            Padding(
                              padding: const EdgeInsets.only(left: 18),
                              child: locationRow(startPoint: false, order: order),
                            ),
                          SizedBox(
                              height: type == ButtonType.show
                                  ? 18
                                  : type == ButtonType.take
                                  ? 27
                                  : 24),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            child: Row(
                              children: [
                                infoBox(order: order, isPay: true, width: screenWidth),
                                const Spacer(),
                                infoBox(order: order, isPay: false, width: screenWidth),
                              ],
                            ),
                          ),
                          SizedBox(height: type == ButtonType.show ? 18 : 10),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 18),
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, bottom: 15, top: 11),
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFF26282D),
                            ),
                            child: TextContainer(order.warning, fontSize: 15),
                          ),
                          SizedBox(
                              height: type == ButtonType.close
                                  ? 24 : 0),

                          if (type == ButtonType.close)
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 18),
                              child: checkColumn(order),
                            ),

                        ],
                      ),
                    ),
                  ),

                  Positioned(
                      // bottom: 0,
                      left: 0,
                      right: 0,
                      top: 12,
                      child: SvgPicture.asset("assets/icons/line.svg")),


                  if (type == ButtonType.show)
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 21 ,left: 18,bottom: 15),
                        child: Stack(
                            children: [
                          AnimatedTimerButton(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 14, left: (screenWidth * 0.9053) * 0.3172),
                              child: TextContainer(
                                "ПРИНЯТЬ",
                                textColor: Colors.black,
                                fontWeight: FontWeight.w800,
                                fontSize: 25,
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                type = ButtonType.take;
                              });
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 45, left: (screenWidth * 0.9053) * 0.2634),
                            child: Row(
                              children: [
                                TextContainer(
                                  "Тариф ",
                                  textColor: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                ),
                                TextContainer(
                                  "Комфорт +",
                                  textColor: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ),
                    ),


                  if (type == ButtonType.take)
                    Positioned(
                      bottom: 199,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: AnimatedTimerButton(
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 28, left: (screenWidth * 0.9053) * 0.34),
                            child: TextContainer(
                              "НА МЕСТЕ",
                              textColor: Colors.black,
                              fontWeight: FontWeight.w800,
                              fontSize: 22,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              type = ButtonType.close;
                            });
                          },
                        ),
                      ),
                    ),
                  if (type == ButtonType.take) const SizedBox(height: 15),
                  if (type == ButtonType.take)
                    Positioned(
                      bottom: 107,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: AnimatedTimerButton(
                          animationDuration: 1250,
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 28, left: (screenWidth * 0.9053) * 0.34),
                            child: TextContainer(
                              "ПОЕХАЛИ",
                              textColor: Colors.black,
                              fontWeight: FontWeight.w800,
                              fontSize: 22,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              type = ButtonType.close;
                            });
                          },
                        ),
                      ),
                    ),
                  if (type == ButtonType.take)
                    const SizedBox(height: 15),
                  if (type == ButtonType.take)
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 18),
                        child: buttonContainer(
                          height: 77,
                          fontSize: 22,
                          textColor: Colors.black,
                          fontWeight: FontWeight.w800,
                          containerColor: Color(0xFFFFD600),
                          text: ("ЗАВЕРШИТЬ ПОЕЗДКУ"),

                          onTap: () {
                            setState(() {
                              type = ButtonType.close;
                            });
                          },
                        ),
                      ),
                    ),

                  if (type == ButtonType.close)
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
                        child: buttonContainer(
                          fontSize: 22,
                          textColor: Colors.black,
                          fontWeight: FontWeight.w800,
                          containerColor: Color(0xFFFFD600),
                          text: ("ЗАКРЫТЬ ЗАКАЗ"),

                          onTap: () {
                            setState(() {
                              Navigator.pop(context);
                              rateButtonSheet(context, () { });
                            });
                          },
                        ),
                      ),
                    ),

                ],
              ),
            );
          });
    },
  );
}

Widget priceAndDistance({required OrderInfo order}) {
  return Padding(
    padding: const EdgeInsets.only(left: 18, right: 24),
    child: Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextContainer(
              formatCurrency(order.orderPrice),
              fontWeight: FontWeight.w700,
              fontSize: 45,
            ),
            const TextContainer(
              "Цена заказа, uzs",
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextContainer(
              "${(order.distance).toString().replaceAll('.', ',')}",
              fontWeight: FontWeight.w700,
              fontSize: 55,
              textColor: Color(0xFFFFD600),
            ),
            const TextContainer(
              "Подача авто, км",
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ],
        ),
      ],
    ),
  );
}

Widget clientInfoTake(
    {required OrderInfo order, required Widget rightWidgets}) {
  return Padding(
    padding: const EdgeInsets.only(left: 17, right: 19),
    child: Row(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFF9AD42), width: 1),
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage(order.clientAvatar), fit: BoxFit.cover)),
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
        rightWidgets
      ],
    ),
  );
}
