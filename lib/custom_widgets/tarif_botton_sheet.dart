import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taxidriver/custom_widgets/container_button.dart';
import 'package:taxidriver/custom_widgets/settings_button.dart';
import 'package:taxidriver/custom_widgets/text_container.dart';
import 'package:taxidriver/main.dart';
import 'package:taxidriver/theme/colors.dart';

Future<void> tarifButtonSheet(BuildContext context, VoidCallback onPressed) async {
  bool eco = true;
  bool standart = true;
  bool comfort= true;
  bool hbrt= false;
  bool bizness = false;
  await showModalBottomSheet(
    backgroundColor: Color(0xFF2C313A).withOpacity(0.2),
    context: context,
    builder: (BuildContext builderContext) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(horizontal: 17),
            decoration: BoxDecoration(
              color: Theme.of(context).customColor.buttonSheetColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 15),
                  SvgPicture.asset("assets/icons/line.svg",color: Theme.of(context).customColor.mainTextColor,),
                  const SizedBox(height: 10),
                  const TextContainer(
                    textAlign: TextAlign.center,
                    "Тарифные планы",
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                  const SizedBox(height: 18),
                  settingsButton(
                    isOn: eco,
                    buttonType: ButtonType.switchB,
                    title: "Эконом",
                    onChanged: (value) {
                      setState(() {
                        eco = value;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  settingsButton(
                    isOn: standart,
                    buttonType: ButtonType.switchB,
                    title: "Стандарт",
                    onChanged: (value) {
                      setState(() {
                        standart = value;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  settingsButton(
                    isOn: comfort,
                    buttonType: ButtonType.switchB,
                    title: "Комфорт",
                    onChanged: (value) {
                      setState(() {
                        comfort = value;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  settingsButton(
                    isOn: hbrt,
                    buttonType: ButtonType.switchB,
                    title: "Семейный",
                    onChanged: (value) {
                      setState(() {
                        hbrt = value;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  settingsButton(
                    isOn: bizness,
                    buttonType: ButtonType.switchB,
                    title: "Бизнес-класс",
                    onChanged: (value) {
                      setState(() {
                        bizness = value;
                      });
                    },
                  ),
                  const SizedBox(height: 38),
                  buttonContainer(
                    onTap: onPressed,
                    height: 51,
                    text: "Сохранить",
                    containerColor: const Color(0xFFFFD600),
                    textColor: Colors.black,
                  ),
                  const SizedBox(height: 30),

                ],
              ),
            ),
          );
        },
      );
    },
  );
}
