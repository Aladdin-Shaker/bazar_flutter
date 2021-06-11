import 'package:bazar/config/constants.dart';
import 'package:bazar/views/screens/account/account.dart';
import 'package:bazar/views/screens/auth/signin/signin_screen.dart';
import 'package:bazar/views/screens/auth/signup/signup_screen.dart';
import 'package:bazar/views/screens/cart/cart.dart';
import 'package:bazar/views/screens/categories/categories.dart';
import 'package:bazar/views/screens/home/home_screen.dart';
import 'package:bazar/views/screens/init/init_screen.dart';
import 'package:bazar/views/screens/landing/landing_screen.dart';
import 'package:bazar/views/screens/messages/messages.dart';
import 'package:bazar/views/screens/undefined/undefined.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case landingViewRoute:
      return MaterialPageRoute(builder: (context) => const LandingScreen());

    case initViewRoute:
      return MaterialPageRoute(builder: (context) => const InitScreen());

    case messagesViewRoute:
      return MaterialPageRoute(builder: (context) => const MessagesScreen());

    case cartViewRoute:
      return MaterialPageRoute(builder: (context) => const CartScreen());

    case accountViewRoute:
      return MaterialPageRoute(builder: (context) => const AccountScreen());

    case signupViewRoute:
      return MaterialPageRoute(builder: (context) => const SignupScreen());

    case signinViewRoute:
      return MaterialPageRoute(builder: (context) => const SigninScreen());

    case homeViewRoute:
      return MaterialPageRoute(builder: (context) => HomeScreen());

    case categoriesViewRoute:
      return MaterialPageRoute(builder: (context) => CategoriesScreen());

    default:
      return MaterialPageRoute(
        builder: (context) => UndefinedScreen(name: settings.name),
      );
  }
}
