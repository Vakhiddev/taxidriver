import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxidriver/theme/colors.dart';

import '../main.dart';
enum InputType {
  cardNumber,
  phoneNumber,
  dueDate,
  simple,
}
class CustomTextField extends StatefulWidget {
  final int? maxLength;
  final InputType inputType;
  final TextEditingController controller;
  final double? height;
  final String? hintText;
  final Color? color;
  const CustomTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.height,
    this.maxLength,
    this.color,
    required this.inputType,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: widget.inputType != InputType.simple ? 12 : 4,
          left: widget.inputType == InputType.dueDate ? screenWidth * 0.2769 * 0.18 : widget.inputType != InputType.simple ? 10 : 20),
      height: widget.height ?? 60,
      // height: 30,
      decoration: BoxDecoration(
          color: widget.color ?? Theme.of(context).customColor.textFieldColor,
          borderRadius: BorderRadius.circular(5),
        border: Border.all(width: 1,color: Theme.of(context).customColor.borderColor)
      ),
      child: Stack(
        children: [
          if (widget.inputType == InputType.cardNumber)
            SvgPicture.asset("assets/icons/wallet2.svg", width: 24,height: 17,
              color: Theme.of(context).customColor.mainTextColor,),
          const SizedBox(width: 12),
          Padding(
            padding: EdgeInsets.only(
              left: widget.inputType == InputType.cardNumber ? screenWidth * 0.078  :
              widget.inputType == InputType.dueDate ? screenWidth * 0.022 :
              widget.inputType == InputType.phoneNumber ? screenWidth * 0.011 : 0,
                top: widget.inputType != InputType.simple ? 5 : 0),
            child: TextField(
              maxLength: widget.maxLength,
              controller: widget.controller,
              keyboardType: widget.inputType != InputType.simple ? TextInputType.number : TextInputType.text,
              decoration: InputDecoration(
                  // counterStyle: const TextStyle(height: double.minPositive,),
                  counterText: "",
                  border: InputBorder.none,
                  hintText: widget.hintText ?? '',
                  hintStyle: GoogleFonts.montserrat(
                    textStyle:  TextStyle(
                      color: Theme.of(context).customColor.mainTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  )
              ),
              maxLines: 1,
              minLines: 1,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),

              onChanged: (value) {
                setState(() {
                  print("setstate worked");
                  if(widget.inputType != InputType.simple) {
                    widget.controller.text = formatInput(value);

                  }
                });

              },
            ),
          ),
        ],
      ),
    );
  }
  String formatInput(String input) {
    switch (widget.inputType) {
      case InputType.cardNumber:
        return formatCardNumber(input);
      case InputType.phoneNumber:
        return formatPhoneNumber(input);
      case InputType.dueDate:
        return formatDueDate(input);
      default:
        return input;
    }
  }

}
String formatCardNumber(String input) {
  String digitsOnly = input.replaceAll(RegExp(r'[^0-9]'), '');
  String formatted = '';
  for (int i = 0; i < digitsOnly.length; i++) {
    if (i > 0 && i % 4 == 0) {
      formatted += ' ';
    }
    formatted += digitsOnly[i];
  }
  return formatted;
}

String formatDueDate(String input) {
  String digitsOnly = input.replaceAll(RegExp(r'[^0-9]'), '');
  String formatted = '';

  for (int i = 0; i < digitsOnly.length; i++) {
    if (i == 2) {
      formatted += '/';
    }
    formatted += digitsOnly[i];
  }
  return formatted;
}

String formatPhoneNumber(String input) {
  String digitsOnly = input.replaceAll(RegExp(r'[^0-9]'), '');

  if (digitsOnly.startsWith('998')) {
    digitsOnly = digitsOnly.substring(3);
  }
  digitsOnly = digitsOnly.substring(0, digitsOnly.length > 9 ? 9 : digitsOnly.length);

  String formatted = digitsOnly.isEmpty ? '' : '+998';

  List<int> spaceIndices = [0,2, 5, 7, 10];

  for (int i = 0, spaceIndex = 0; i < digitsOnly.length; i++) {
    if (spaceIndex < spaceIndices.length && i == spaceIndices[spaceIndex]) {
      formatted += ' ';
      spaceIndex++;
    }
    formatted += digitsOnly[i];
  }
  return formatted;
}