import 'package:bazar/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

AppBar customAppbar({
  required Widget title,
  required List<Widget> actions,
  required bool isBackBtn,
}) {
  return AppBar(
    elevation: 0.4,
    // centerTitle: true,

    title: title,
    leading: isBackBtn
        ? IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_sharp,
              color: kGrayColor,
            ),
            onPressed: () => Get.back(),
          )
        : const SizedBox.shrink(),
    actions: actions,
    automaticallyImplyLeading: false,
  );
}
