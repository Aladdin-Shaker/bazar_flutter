import 'package:bazar/controllers/category_controller.dart';
import 'package:bazar/controllers/delivery_controller.dart';
import 'package:bazar/controllers/main_controller.dart';
import 'package:bazar/controllers/notifications_controller.dart';
import 'package:bazar/controllers/product_controller.dart';
import 'package:get/get.dart';

class Binding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<ProductController>(() => ProductController());
    Get.lazyPut<CategoryController>(() => CategoryController());
    Get.lazyPut<NotificationsController>(() => NotificationsController());
    Get.lazyPut<DeliveryController>(() => DeliveryController());
  }
}
