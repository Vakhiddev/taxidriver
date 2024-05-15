import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taxidriver/custom_widgets/container_button.dart';
import 'package:taxidriver/custom_widgets/text_container.dart';

Future showButtonSheet(BuildContext context, VoidCallback onPressed) async {
  await showModalBottomSheet(
    backgroundColor: Color(0xFF2C313A).withOpacity(0.2),
    isDismissible: false,
    context: context,
    builder: (BuildContext builderContext) {
      return Container(
        height: 220,
        width: double.maxFinite,
        padding: const EdgeInsets.only(left: 15, right: 23),
        decoration: const BoxDecoration(
          color: Color(0xFF1F2126),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 12),
            SvgPicture.asset("assets/icons/line.svg"),
            const SizedBox(height: 26),
            const TextContainer(
              textAlign: TextAlign.center,
              "Ваша заявка успешно\nотправлена, дождитесь ответа\nмодерации по SMS",
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
            const SizedBox(height: 29),
            buttonContainer(
              onTap: onPressed,
              height: 51,
              text: "ОК",
              containerColor: const Color(0xFFFFD600),
              textColor: Colors.black,
            ),
            const Spacer()
          ],
        ),
      );
    },
  );
}
