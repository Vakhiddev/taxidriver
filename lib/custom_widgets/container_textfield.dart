import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

enum InputType {
  cardNumber,
  phoneNumber,
  dueDate,
  simple,
}

class CustomTextField extends StatefulWidget {
  final InputType inputType;
  final TextEditingController controller;
  final double? height;
  final String? hintText;
  const CustomTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.height,
    required this.inputType,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: widget.inputType != InputType.simple ? 10 : 20),
      height: widget.height ?? 60,
      decoration: BoxDecoration(
        color: const Color(0xFF26282D),
        borderRadius: BorderRadius.circular(5)
      ),
      child: Row(
        children: [
          if (widget.inputType == InputType.cardNumber)
            SvgPicture.asset("assets/icons/wallet2.svg", width: 24, height: 24),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: widget.controller,
              keyboardType: widget.inputType != InputType.simple ? TextInputType.number : TextInputType.text,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hintText ?? '',
                hintStyle: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    color: Color(0xFFB0B0B0),
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
                color: Colors.white,
              ),

              onChanged: (value) {
                // setState(() {
                //
                // });
                if(widget.inputType != InputType.simple) {
                  // setState(() {
                    widget.controller.text = formatInput(value);
                    // widget.controller.selection = TextSelection.fromPosition(
                    //   TextPosition(offset: widget.controller.text.length),
                    // );
                  // });
                } else {

                }
              },
            ),
          ),
        ],
      ),
    );
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

  String formatPhoneNumber(String input) {
    String digitsOnly = input.replaceAll(RegExp(r'[^0-9]'), '');
    String formatted = '+';

    List<int> spaceIndices = [3, 5, 8,10];

    for (int i = 0, spaceIndex = 0; i < digitsOnly.length; i++) {
      if (spaceIndex < spaceIndices.length && i == spaceIndices[spaceIndex]) {
        formatted += ' ';
        spaceIndex++;
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
