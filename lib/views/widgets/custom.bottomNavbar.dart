import 'package:bazar/config/constants.dart';
import 'package:bazar/config/sizes.dart';
import 'package:bazar/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class CustomBottomNavBar extends GetView<MainController> {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      builder: (controller) {
        return BottomNavigationBar(
          unselectedItemColor: kSecondaryColor,
          selectedItemColor: kPrimaryColor,
          iconSize: getProportionateScreenWidth(25),
          showUnselectedLabels: true,
          enableFeedback: true,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          currentIndex: controller.getSelectedBottomBarIndex,
          onTap: controller.onSelectBottomBarItem,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.messenger_outline_sharp),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_outlined),
              label: 'Account',
            )
          ],
        );
      },
    );
  }
}
