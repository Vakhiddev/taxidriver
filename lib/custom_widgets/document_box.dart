import 'package:flutter/material.dart';
import 'package:taxidriver/theme/colors.dart';

Widget documentWidget({required String imagePath}) {
  return Builder(
    builder: (context) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 10),
        decoration: BoxDecoration(
            color: Theme.of(context).customColor.containerColor,
            borderRadius: BorderRadius.circular(5)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(imagePath),
        ),
      );
    }
  );
}
