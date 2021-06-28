import 'package:bazar/config/constants.dart';
import 'package:bazar/views/screens/account/account.dart';
import 'package:bazar/views/screens/auth/signin/signin_screen.dart';
import 'package:bazar/views/screens/auth/signup/signup_screen.dart';
import 'package:bazar/views/screens/categories/categories_screen.dart';
import 'package:bazar/views/screens/home/home_screen.dart';
import 'package:bazar/views/screens/init/init_screen.dart';
import 'package:bazar/views/screens/messages/messages_screen.dart';
import 'package:bazar/views/screens/search/search_screen.dart';
import 'package:bazar/views/screens/single_product/single_product.dart';
import 'package:get/route_manager.dart';

List<GetPage<dynamic>>? getPagesRoutes = [
  GetPage(
    name: accountViewRoute,
    page: () => const AccountScreen(),
    title: 'account',
  ),
  GetPage(
    name: signinViewRoute,
    page: () => const SigninScreen(),
    title: 'signin',
  ),
  GetPage(
    name: initViewRoute,
    page: () => const InitScreen(),
    title: 'init',
  ),
  GetPage(
    name: landingViewRoute,
    page: () => SearchScreen(),
    title: 'landing',
  ),
  GetPage(
    name: signupViewRoute,
    page: () => const SignupScreen(),
    title: 'signup',
  ),
  GetPage(
    name: homeViewRoute,
    page: () => HomeScreen(),
    title: 'home',
  ),
  GetPage(
    name: categoriesViewRoute,
    page: () => CategoriesScreen(),
    title: 'categories',
  ),
  GetPage(
    name: searchViewRoute,
    page: () => SearchScreen(),
    title: 'search',
  ),
  GetPage(
    name: singleProductViewRoute,
    page: () => SingleProductScreen(),
    title: 'single_product',
  ),
  GetPage(
    name: messagesViewRoute,
    page: () => const MessagesScreen(),
    title: 'messages',
  ),
  GetPage(
    name: cartViewRoute,
    page: () => SearchScreen(),
    title: 'cart',
  ),
];
