import 'package:bazar/config/constants.dart';
import 'package:bazar/config/sizes.dart';
import 'package:flutter/material.dart';

Widget appBarCartBtn() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Stack(
        children: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: kGrayColor,
              size: getProportionateScreenWidth(35),
            ),
            onPressed: () {},
          ),
          Positioned(
            top: 5,
            right: 8,
            child: Container(
              height: 18,
              width: 18,
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
