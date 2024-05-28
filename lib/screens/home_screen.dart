import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxidriver/custom_widgets/oreder_bottom_sheet.dart';
import 'package:taxidriver/custom_widgets/text_container.dart';
import 'package:taxidriver/demo_data/all_data.dart';
import 'package:taxidriver/main.dart';
import 'package:taxidriver/screens/menu_screen.dart';
import 'package:taxidriver/screens/one_order_screen.dart';
import 'package:taxidriver/theme/colors.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../custom_widgets/animated_button.dart';
import '../custom_widgets/home_widgets.dart';
import '../custom_widgets/tarif_botton_sheet.dart';
import 'finance_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  YandexMapController? mapController;
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);
  bool buttonIsOn = false;
  bool isOnline = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
            children: [
          YandexMap(
            onMapCreated: (controller) {
              mapController = controller;
              // Set initial camera position using moveCamera
              mapController!.moveCamera(
                CameraUpdate.newCameraPosition(
                  const CameraPosition(
                    target: Point(latitude: 55.753215, longitude: 37.622504),
                    zoom: 20,
                  ),
                ),
              );
            },
            onCameraPositionChanged: (cameraPosition, reason, _) async {
              // Handle camera position changes if needed
              setState(() {});
            },
            mapType: MapType.hybrid,
          ),
              Padding(
                padding: const EdgeInsets.only(top: 9,left: 17,right: 17),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MenuScreen()));
                      },
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFFF9AD42), width: 1),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(user.avatar),
                                fit: BoxFit.cover
                            )
                        ),
                      ),
                    ),
                    const SizedBox(width: 7),
                    TextContainer(
                      rateFormat(user.rate),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    textColor: Colors.black,),
                    const SizedBox(width: 7),
                    SvgPicture.asset("assets/icons/star.svg"),
                    const Spacer(),
                    const SizedBox(height: 12),
                    SpeedDial(
                      childrenButtonSize: Size(screenWidth * 0.40,55),
                      backgroundColor: Colors.transparent,
                      overlayColor: Theme.of(context).customColor.buttonSheetColor.withOpacity(0.9),
                      activeBackgroundColor: Theme.of(context).customColor.buttonSheetColor.withOpacity(0.79),
                      direction: SpeedDialDirection.down,
                      curve: Curves.easeInBack,
                      openCloseDial: isDialOpen,
                      child: SvgPicture.asset("assets/icons/black_filter.svg"),
                      activeChild:  SvgPicture.asset("assets/icons/buttons/x.svg"),
                      children: [
                        SpeedDialChild(
                          labelBackgroundColor: Colors.transparent,
                            child: floatButton(
                                title: "Мои тарифы", onPressed: (){
                              setState(() {
                                isDialOpen.value = false;
                              });
                              tarifButtonSheet(context,(){
                                    Navigator.pop(context);
                              });
                            }),
                        ),
                        SpeedDialChild(
                          labelBackgroundColor: Colors.transparent,
                          child: floatButton(
                              title: "Мой баланс", onPressed: (){
                                setState(() {
                                  isDialOpen.value = false;
                                });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const FinanceScreen()));
                          }),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              if(isOnline == true)
              Positioned(
                bottom: 240,
                left: 60,
                child: InkWell(
                  onTap: (){
                    orderButtonSheet(context, () { },orders[0],ButtonType.show);
                  },
                  child: Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                        border:
                        Border.all(color: const Color(0xFFF9AD42), width: 1),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(orders[0].clientAvatar),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
              if(buttonIsOn == true)
              Positioned(
                bottom: 86,
                left: screenWidth * 0.2820,
                child: isOnlineButton(isOnline: isOnline,onPressed: (){
                  setState(() {
                    isOnline = !isOnline;
                  });
                }),
              ),
              if(buttonIsOn == false)
                Positioned(
                    bottom: 149,
                    child: selectOnlineButton(isOnline: true,
                        onPressed: (){
                      setState(() {
                        isOnline = true;
                      });
                        })),
              if(buttonIsOn == false)
                Positioned(
                    bottom: 86,
                    child: selectOnlineButton(isOnline: false,
                        onPressed: (){
                          setState(() {
                            isOnline = false;
                          });
                        })),
              Positioned(
                bottom: 16,
                child: isOnlineChangingButton(isOnline:isOnline,buttonIsOn: buttonIsOn,
                    onPressed: (){
                  setState(() {
                    buttonIsOn = !buttonIsOn;
                  });
                    }),
              )
        ]),
      ),
    );
  }

  Widget floatButton({required String title,required VoidCallback onPressed}) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.only(left: 15,right: 9,top: 13,bottom: 13),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
              border: Border.all(width: 0.4,color: Colors.white),
          color: const Color(0xFF1F2126),
        ),
        child: Row(
          children: [
            TextContainer(title,
            fontWeight: FontWeight.w500,
              fontSize: 16,
              textColor: Colors.white,
            ),
            const Spacer(),
            SvgPicture.asset("assets/icons/next.svg")
          ],
        ),
      ),
    );
  }
}
