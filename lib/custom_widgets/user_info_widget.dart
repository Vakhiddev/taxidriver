import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taxidriver/custom_widgets/text_container.dart';

Widget userInfoW({
  required String avatar,
  required String fio,
  required int id,
  required String phoneNumber,
  VoidCallback? onPressed,
  VoidCallback? onCanceled,

}) {
  return InkWell(
    onTap: onPressed,
    child: Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Row(
        children: [
          Container(
            width: 79,
            height: 79,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFF9AD42), width: 1),
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(avatar),
                fit: BoxFit.cover
              )
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 7),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextContainer(
                      fio,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      textColor: Colors.white,
                    ),
                    const Spacer(),
                    SvgPicture.asset("assets/icons/cances.svg"),

                  ],
                ),
                const SizedBox(height: 4),
                TextContainer(
                  phoneNumber,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  textColor: Colors.white,
                ),
                const SizedBox(height: 12),
                TextContainer(
                  "ID: ${id.toString().padLeft(6, '0')}",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
