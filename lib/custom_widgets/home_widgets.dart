import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxidriver/custom_widgets/text_container.dart';
import 'package:taxidriver/main.dart';

Widget isOnlineButton({required bool isOnline,required VoidCallback onPressed}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      width: 170,
      height: 55,
      padding: EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: isOnline ? Color(0xFFE74C3C) : Color(0xFF1ABC9C),
      ),
      child: Row(
        children: [
          SvgPicture.asset("assets/icons/off.svg",
            color: isOnline ? Colors.white : Colors.black,
          ),
          const Spacer(),
          TextContainer(isOnline ? "НА ОТДЫХ" : "НА СМЕНУ",
          textColor: isOnline ? Colors.white : Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w700,),
          const Spacer()
        ],
      ),
    ),
  );
}

Widget isOnlineChangingButton({required bool isOnline,required VoidCallback onPressed,
required bool buttonIsOn}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      width: buttonIsOn ? screenWidth * 0.9128 : 55,
      height: 55,
      margin: EdgeInsets.symmetric(horizontal: 17),
      padding: EdgeInsets.only(left: 12,right: buttonIsOn ? 12 : 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFF23262B),
      ),
      child: Row(
        children: [
          SvgPicture.asset("assets/icons/onine_dot.svg",
            color: isOnline ? Color(0xFF1ABC9C) : Color(0xFFE74C3C) ,
          ),
          const Spacer(),
          if(buttonIsOn == true)
          TextContainer(isOnline ? "Сейчас вы ONLINE" : "Сейчас вы OFFLINE",
            textColor: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w700,),
          if(buttonIsOn == false)
            SvgPicture.asset("assets/icons/next.svg"),
          const Spacer()
        ],
      ),
    ),
  );
}

Widget selectOnlineButton({required bool isOnline,required VoidCallback onPressed}) {
  return InkWell(
    onTap: onPressed,
    child: SizedBox(
      width: screenWidth * 0.958,
      child: Row(
        children: [
          Container(
            width:screenWidth * 0.4564,
            height: 55,
            margin: EdgeInsets.only(left: 17),
            padding: EdgeInsets.only(left: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),topLeft: Radius.circular(10)),
              color: Color(0xFF23262B),
            ),
            child: Row(
              children: [
                SvgPicture.asset("assets/icons/onine_dot.svg",
                  color: isOnline ? Color(0xFF1ABC9C) : Color(0xFFE74C3C),
                ),
                SvgPicture.asset("assets/icons/back_arrow.svg"),
                const SizedBox(width: 18,),
                  TextContainer(isOnline ? "ONLINE" : "OFFLINE",
                    textColor: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,),
              ],
            ),
          ),
          Container(
            width:screenWidth * 0.4564,
            height: 55,
            // margin: EdgeInsets.only(right: 17),
            padding: EdgeInsets.only(left: 13),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),topRight: Radius.circular(10)),
              color: isOnline ? Color(0xFFE74C3C) : Color(0xFF1ABC9C),
            ),
            child: Row(
              children: [
                SvgPicture.asset("assets/icons/off.svg",
                  color: isOnline ? Colors.white : Colors.black,
                ),
                const SizedBox(width: 15),
                TextContainer(isOnline ? "НА ОТДЫХ" : "НА СМЕНУ",
                  textColor: isOnline ? Colors.white : Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}