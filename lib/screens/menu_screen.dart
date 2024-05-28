import 'package:flutter/material.dart';
import 'package:taxidriver/custom_widgets/menu_button.dart';
import 'package:taxidriver/custom_widgets/user_info_widget.dart';
import 'package:taxidriver/demo_data/all_data.dart';
import 'package:taxidriver/screens/finance_screen.dart';
import 'package:taxidriver/screens/home_screen.dart';
import 'package:taxidriver/screens/my_profile.dart';
import 'package:taxidriver/screens/orders_screen.dart';
import 'package:taxidriver/screens/settings.dart';
import 'package:taxidriver/theme/colors.dart';

import '../custom_widgets/text_container.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:
              const EdgeInsets.only(top: 38, bottom: 22, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 38),
              userInfoW(
                avatar: user.avatar,
                fio: user.fio,
                id: user.id,
                phoneNumber: user.phoneNumber,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyProfile()));
                },
                onCanceled: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 42),
              const TextContainer(
                "Основное меню",
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
              const SizedBox(height: 21),
              MainButton(
                icon: "assets/icons/wallet.svg",
                title: "Финансы",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FinanceScreen()));
                },
              ),
              MainButton(
                icon: "assets/icons/finance.svg",
                title: "Мои заказы",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OrdersScreen()));
                },
              ),
              MainButton(
                icon: "assets/icons/settings.svg",
                title: "Настройки",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingsScreen()));

                },
              ),
              MainButton(
                icon: "assets/icons/chat.svg",
                title: "Служба поддержки",
                onPressed: () {},
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 11),
                child: InkWell(
                  onTap: () {},
                  child: TextContainer(
                    "Выход из аккаунта",
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    textColor: Theme.of(context).customColor.thirdTextColor
                  ),
                ),
              ),
              const SizedBox(
                height: 29,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 11),
                child: TextContainer(
                  "Версия 1.0..1",
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
