import 'package:bazar/config/constants.dart';
import 'package:bazar/config/sizes.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Text(
                'bazar',
                style: TextStyle(
                    color: kPrimaryColor,
                    fontFamily: 'Poppins',
                    fontSize: getProportionateScreenWidth(50)),
              ),
              Image.asset(
                'assets/images/landing.png',
                height: getProportionateScreenHeight(350),
                width: getProportionateScreenWidth(300),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(right: 10.0, left: 15.0),
                child: ElevatedButton(
                  onPressed: () => {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.all(15),
                    ),
                  ),
                  child: Text(
                    'Take a look',
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(15),
                    ),
                  ),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(40)),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(right: 10.0, left: 15.0),
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/signin'),
                  child: Center(
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: getProportionateScreenWidth(20),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
