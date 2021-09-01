import 'package:bazar/config/sizes.dart';
import 'package:bazar/views/widgets/custom_cart_title.dart';
import 'package:flutter/material.dart';

class TitleWithNotifyNo extends StatelessWidget {
  const TitleWithNotifyNo({
    Key? key,
    required this.title,
    required this.count,
  }) : super(key: key);

  final String title;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        customCartTitle(
          title: title,
          titleSize: 18,
          press: null,
        ),
        SizedBox(width: getProportionateScreenHeight(10)),
        Container(
          height: 17,
          width: 17,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$count',
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
