// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:taxidriver/custom_widgets/container_button.dart';
// import 'package:taxidriver/custom_widgets/settings_button.dart';
// import 'package:taxidriver/custom_widgets/text_container.dart';
// import 'package:taxidriver/main.dart';
//
// Future tarifButtonSheet(BuildContext context, VoidCallback onPressed) async {
//   bool eco;
//   bool standart;
//   bool comfort;
//   bool hbrt;
//   bool bizness;
//
//   await showModalBottomSheet(
//     backgroundColor: Color(0xFF2C313A).withOpacity(0.2),
//     isDismissible: false,
//     context: context,
//     builder: (BuildContext builderContext) {
//       return Container(
//         height: screenHeight * 0.5985,
//         width: double.maxFinite,
//         padding: const EdgeInsets.symmetric(horizontal: 17),
//         decoration: const BoxDecoration(
//           color: Color(0xFF1F2126),
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(10),
//             topRight: Radius.circular(10),
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const SizedBox(height: 15),
//             SvgPicture.asset("assets/icons/line.svg"),
//             const SizedBox(height: 10),
//             const TextContainer(
//               textAlign: TextAlign.center,
//               "Тарифные планы",
//               fontWeight: FontWeight.w600,
//               fontSize: 18,
//             ),
//             const SizedBox(height: 18),
//             settingsButton(
//                 isOn: eco,
//                 buttonType: ButtonType.switchB, title: "Эконом",
//                 onChanged: (value){
//                   setState(() {
//                     isOn = value;
//                   });
//                 }),
//
//             buttonContainer(
//               onTap: onPressed,
//               height: 51,
//               text: "Сохранить",
//               containerColor: const Color(0xFFFFD600),
//               textColor: Colors.black,
//             ),
//             const Spacer()
//           ],
//         ),
//       );
//     },
//   );
// }
