import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxidriver/custom_widgets/text_container.dart';
import 'package:taxidriver/demo_data/all_data.dart';
import 'package:taxidriver/screens/menu_screen.dart';
import 'package:taxidriver/screens/one_order_screen.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  YandexMapController? mapController;

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
                    InkWell(
                        child: SvgPicture.asset("assets/icons/black_filter.svg")),

                  ],
                ),
              )
        ]),
      ),
    );
  }
}
