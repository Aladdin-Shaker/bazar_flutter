import 'package:bazar/config/binding.dart';
import 'package:bazar/config/theme.dart';
import 'package:bazar/views/screens/init/init_screen.dart';
import 'package:bazar/views/screens/undefined/undefined_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import './config/routes.dart' as router;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      unknownRoute: GetPage(
        name: '/undefiend',
        page: () => const UndefinedScreen(),
      ),
      initialBinding: Binding(),
      defaultTransition: Transition.native,
      debugShowCheckedModeBanner: false,
      title: 'Bazar',
      theme: buildThemeData(),
      home: const InitScreen(),
      getPages: router.getPagesRoutes,
    );
  }
}
