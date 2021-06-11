import 'package:bazar/config/sizes.dart';
import 'package:flutter/material.dart';

Widget customCartTitle({
  required String title,
  required double titleSize,
  required Function? press,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'Poppins-Bold',
          fontWeight: FontWeight.w600,
          fontSize: getProportionateScreenWidth(titleSize),
        ),
      ),
      if (press != null)
        GestureDetector(
          onTap: () => press(),
          child: Text(
            'View all',
            style: TextStyle(
              color: Colors.black,
              fontSize: getProportionateScreenWidth(15),
            ),
          ),
        )
      else
        Container()
    ],
  );
}
