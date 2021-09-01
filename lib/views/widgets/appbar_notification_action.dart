import 'package:bazar/config/constants.dart';
import 'package:bazar/config/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

Widget appBarNotificationBtn() {
  return Row(
    children: [
      IconButton(
        icon: Icon(
          Icons.search_outlined,
          color: kGrayColor,
          size: getProportionateScreenWidth(35),
        ),
        onPressed: () => Get.toNamed(searchViewRoute),
      ),
      GestureDetector(
        onTap: () => Get.toNamed(notificationsViewRoute),
        child: Stack(
          children: [
            Icon(
              Icons.notifications_none,
              color: kGrayColor,
              size: getProportionateScreenWidth(40),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                height: 17,
                width: 17,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      '10',
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
