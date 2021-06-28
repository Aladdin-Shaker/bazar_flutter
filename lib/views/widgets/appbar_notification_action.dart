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
      Stack(
        children: [
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: kGrayColor,
              size: getProportionateScreenWidth(35),
            ),
            onPressed: () {},
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              height: 20,
              width: 20,
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
    ],
  );
}
