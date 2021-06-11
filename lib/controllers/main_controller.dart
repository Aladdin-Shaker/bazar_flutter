import 'package:bazar/views/screens/cart/cart.dart';
import 'package:bazar/views/screens/home/home_screen.dart';
import 'package:bazar/views/screens/messages/messages.dart';
import 'package:flutter/material.dart';
import 'package:bazar/views/screens/account/account.dart';
import 'package:get/state_manager.dart';

class MainController extends GetxController {
  int _selectedBottomBarIndex = 0;
  int get getSelectedBottomBarIndex => _selectedBottomBarIndex;

  Widget _currentPage = HomeScreen();
  Widget get getCurrentPage => _currentPage;

  void onSelectBottomBarItem(int index) {
    if (_selectedBottomBarIndex == index) {
      return;
    } else {
      _selectedBottomBarIndex = index;
      switch (index) {
        case 0:
          _currentPage = HomeScreen();
          break;
        case 1:
          _currentPage = const MessagesScreen();
          break;
        case 2:
          _currentPage = const CartScreen();
          break;
        case 3:
          _currentPage = const AccountScreen();
          break;
        default:
      }
    }
    update();
  }
}
