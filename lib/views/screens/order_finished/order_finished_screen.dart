import 'package:bazar/config/constants.dart';
import 'package:bazar/config/sizes.dart';
import 'package:bazar/views/screens/delivery_status/delivery_status_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderFinishedScreen extends StatelessWidget {
  const OrderFinishedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(40),
          color: kPrimaryColor,
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: getProportionateScreenWidth(80),
                height: getProportionateScreenHeight(80),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Icon(
                  Icons.check,
                  color: kPrimaryColor,
                  size: getProportionateScreenWidth(40),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              Text(
                'Order Placed !',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: getProportionateScreenWidth(15),
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              Text(
                'Your Order Was Placed Successfully, For More Details, Check Delivery Status Under Profile Tab',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: getProportionateScreenWidth(15),
                  fontWeight: FontWeight.w300,
                ),
                maxLines: 3,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: getProportionateScreenHeight(40)),
              ElevatedButton(
                onPressed: () => Get.offAll(const DeliveryStatusScreen()),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  side: const BorderSide(
                    width: 2.0,
                    color: Colors.white,
                  ),
                ),
                child: SizedBox(
                  width: getProportionateScreenWidth(150),
                  child: const Text(
                    'Delivery Status',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
