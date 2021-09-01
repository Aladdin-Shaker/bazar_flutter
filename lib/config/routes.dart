import 'package:bazar/config/constants.dart';
import 'package:bazar/views/screens/account/account_screen.dart';
import 'package:bazar/views/screens/auth/signin/signin_screen.dart';
import 'package:bazar/views/screens/auth/signup/signup_screen.dart';
import 'package:bazar/views/screens/categories/categories_screen.dart';
import 'package:bazar/views/screens/checkout/checkout_screen.dart';
import 'package:bazar/views/screens/delivery_status/delivery_status_screen.dart';
import 'package:bazar/views/screens/favorite/favorite_screen.dart';
import 'package:bazar/views/screens/home/home_screen.dart';
import 'package:bazar/views/screens/init/init_screen.dart';
import 'package:bazar/views/screens/messages/messages_screen.dart';
import 'package:bazar/views/screens/messages/single_chat.dart';
import 'package:bazar/views/screens/notifications/notifications_screen.dart';
import 'package:bazar/views/screens/order_finished/order_finished_screen.dart';
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
    page: () => const SearchScreen(),
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
    page: () => const SearchScreen(),
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
    name: chatViewRoute,
    page: () => SingleChatScreen(),
    title: 'chat',
  ),
  GetPage(
    name: cartViewRoute,
    page: () => const SearchScreen(),
    title: 'cart',
  ),
  GetPage(
    name: notificationsViewRoute,
    page: () => const NotificationsScreen(),
    title: 'notifications',
  ),
  GetPage(
    name: favoriteViewRoute,
    page: () => const FavoriteScreen(),
    title: 'favorite',
  ),
  GetPage(
    name: checkoutViewRoute,
    page: () => CheckoutScreen(),
    title: 'checkout',
  ),
  GetPage(
    name: deliveryStatusRoute,
    page: () => const DeliveryStatusScreen(),
    title: 'deliver_status',
  ),
  GetPage(
    name: orderFinishedRoute,
    page: () => const OrderFinishedScreen(),
    title: 'order_finished',
  ),
];
