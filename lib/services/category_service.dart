import 'package:bazar/models/category.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class CategoryService extends GetxService {
  static Future<List<Categories>> getCategories() async {
    return Future.delayed(const Duration(seconds: 1), () {
      final List<Categories> categories = [
        Categories("Apparel", Icons.add_reaction_rounded),
        Categories("Watches", Icons.watch_outlined),
        Categories("Food", Icons.no_food_sharp),
        Categories("Phons", Icons.phone_android_outlined),
        Categories("Apparel", Icons.add_reaction_rounded),
        Categories("Watches", Icons.watch_outlined),
        Categories("Food", Icons.no_food_sharp),
        Categories("Phons", Icons.phone_android_outlined),
        Categories("Apparel", Icons.add_reaction_rounded),
        Categories("Watches", Icons.watch_outlined),
        Categories("Food", Icons.no_food_sharp),
        Categories("Phons", Icons.phone_android_outlined),
      ];
      return categories;
    });
  }

  static Future<List<Categories>> getAllCategories() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      Categories.fromJson(
          Categories("Apparel", Icons.add_reaction_rounded).toJson()),
      Categories.fromJson(Categories("Watches", Icons.watch_outlined).toJson()),
      Categories.fromJson(Categories("Food", Icons.no_food_sharp).toJson()),
      Categories.fromJson(
          Categories("Phons", Icons.phone_android_outlined).toJson()),
      Categories.fromJson(
          Categories("Apparel", Icons.add_reaction_rounded).toJson()),
      Categories.fromJson(Categories("Watches", Icons.watch_outlined).toJson()),
      Categories.fromJson(Categories("Food", Icons.no_food_sharp).toJson()),
      Categories.fromJson(
          Categories("Phons", Icons.phone_android_outlined).toJson()),
      Categories.fromJson(
          Categories("Apparel", Icons.add_reaction_rounded).toJson()),
      Categories.fromJson(Categories("Watches", Icons.watch_outlined).toJson()),
      Categories.fromJson(Categories("Food", Icons.no_food_sharp).toJson()),
      Categories.fromJson(
          Categories("Phons", Icons.phone_android_outlined).toJson()),
    ];
  }
}
