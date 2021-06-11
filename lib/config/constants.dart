import 'package:flutter/material.dart';

// fonts
const String fontFamily = "Poppins-Black";

// routes
const String landingViewRoute = '/landing';
const String initViewRoute = '/init';
const String homeViewRoute = '/home';
const String messagesViewRoute = '/messages';
const String cartViewRoute = '/cart';
const String accountViewRoute = '/account';
const String signinViewRoute = '/signin';
const String signupViewRoute = '/signup';
const String categoriesViewRoute = '/categories';
const String logoutRoute = '/logout';
const String undefiendRoute = '/undefiend';

// colors
const kPrimaryColor = Color(0xFF2291FF);
const kSecondaryColor = Color(0xFF0E3746);
const kGrayColor = Color(0xFFDADDE1);
const kTextLigntColor = Color(0xFFFFFFFF);

// device type
// const kTabletBreakpoint = 720.0;
// const kDesktopBreakpoint = 1440.0;

// Form Errors
final RegExp kEmailRegex = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kInvalidEmail = "Please enter valid email";
const String kEmptyEmail = "Email cannot be empty";

const String kEmptyUsername = "Username cannot be empty";
const String kShortUsername = "Username must be at least 3 characters";

const String kEmptyPassword = "Password cannot be empty";
const String kShortPassword = "Password must be at least 6 characters";

final RegExp kPhoneRegex = RegExp(r"'(^(?:[+0]9)?[0-9]{10,12}$)");
const String kInvalidPhone = "Please enter valid phone number";
const String kEmptyPhone = "Phone number cannot be empty";
