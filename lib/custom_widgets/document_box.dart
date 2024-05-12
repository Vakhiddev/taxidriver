import 'package:flutter/cupertino.dart';

Widget documentWidget({required String imagePath}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 10),
    decoration: BoxDecoration(
        color: const Color(0xFF26282D), borderRadius: BorderRadius.circular(5)),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(imagePath),
    ),
  );
}
