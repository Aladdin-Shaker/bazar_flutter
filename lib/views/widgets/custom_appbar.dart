import 'package:bazar/config/constants.dart';
import 'package:bazar/config/sizes.dart';
import 'package:flutter/material.dart';

AppBar customAppbar({
  required List<Widget> actions,
  required bool isBackBtn,
  required bool isSearch,
  required BuildContext context,
}) {
  return AppBar(
    elevation: 0.4,
    title: isSearch
        ? TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.search,
                color: kGrayColor,
                size: getProportionateScreenWidth(30),
              ),
            ),
            style: TextStyle(
              color: Colors.black,
              fontSize: getProportionateScreenWidth(20),
            ),
          )
        : Container(),
    leading: isBackBtn
        ? IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_sharp,
              color: kGrayColor,
            ),
            onPressed: () => Navigator.pop(context),
          )
        : SizedBox.shrink(),
    actions: actions,
    automaticallyImplyLeading: false,
  );
}
