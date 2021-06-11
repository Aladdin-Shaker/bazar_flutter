import 'package:bazar/controllers/main_controller.dart';
import 'package:bazar/views/widgets/custom.bottomNavbar.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  _InitScreenState createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
        init: MainController(),
        builder: (controller) {
          return Scaffold(
            // body: _myPages[controller.getSelectedBottomBarIndex],
            body: controller.getCurrentPage,
            bottomNavigationBar: const CustomBottomNavBar(),
          );
        });
  }
}
