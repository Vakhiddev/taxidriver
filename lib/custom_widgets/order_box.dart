import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxidriver/custom_widgets/text_container.dart';
import 'package:taxidriver/demo_data/all_data.dart';
import 'package:taxidriver/theme/colors.dart';

Widget orderBox({required OrderInfo order, VoidCallback? onPressed}) {
  return Builder(
    builder: (context) {
      bool isLightTheme = Theme.of(context).brightness == Brightness.light;
      return GestureDetector(
        onTap: onPressed,
        child: Container(
          margin: const EdgeInsets.only(bottom: 20),
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: Theme.of(context).customColor.containerColor,
              borderRadius: BorderRadius.circular(8)),
          child: Column(
            children: [
              Container(
                height: 37,
                decoration: BoxDecoration(
                  color: Theme.of(context).customColor.secondContainerColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),topRight: Radius.circular(8),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 15,right: 14,bottom: 0,
                      top: isLightTheme ? 0 : 10),
                  child: Row(
                    children: [
                      TextContainer(
                        formatTime(order.completedTime),
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                      const Spacer(),
                      TextContainer(
                        "${formatCurrency(order.totalPrice)} UZS",
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ],
                  ),
                ),
              ),
              if(isLightTheme != true)
              const SizedBox(height: 7),
              if(isLightTheme != true)
              const Divider(
                color: Color(0xFF353537),
                thickness: 1,
              ),
              _locationRow(order: order,startPoint: true),
              const Divider(
                color: Color(0xFF353537),
                thickness: 1,
                indent: 36,
                endIndent: 29,
              ),
              _locationRow(order: order,startPoint: false),
            ],
          ),
        ),
      );
    }
  );
}

Widget _locationRow({required bool startPoint, required OrderInfo order}) {
  return Padding(
    padding: EdgeInsets.only(left: 13,right: 13,top: 15,
        bottom: startPoint ? 16 : 23),
    child: Row(
      children: [
        SvgPicture.asset(
          "assets/icons/start_point.svg",
          width: 10,
          height: 10,
          color: startPoint ? null : const Color(0xFFFFD600),
        ),
        const SizedBox(width: 14),
        TextContainer(
          startPoint ? order.startedAddress : order.finishedAddress,
          fontWeight: FontWeight.w400,
          fontSize: 18,
        ),
      ],
    ),
  );
}

String formatTime(DateTime input) {
  String hour = input.hour.toString().padLeft(2, '0'); 
  String minute = input.minute.toString().padLeft(2, '0');
  return '${input.day}.${input.month}.${input.year}, $hour:$minute';
}

String formatCurrency(double value) {
  int intValue = value.toInt();
  String integerPart = intValue.toString();
  List<String> groups = [];
  int startIndex = integerPart.length % 3;
  if (startIndex != 0) {
    groups.add(integerPart.substring(0, startIndex));
  }
  for (int i = startIndex; i < integerPart.length; i += 3) {
    groups.add(integerPart.substring(i, i + 3));
  }
  String formattedIntegerPart = groups.join(' ');
  return formattedIntegerPart;
}
