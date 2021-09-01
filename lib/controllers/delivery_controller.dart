import 'package:bazar/models/product.dart';
import 'package:bazar/services/product_service.dart';
import 'package:get/state_manager.dart';

class DeliveryController extends GetxController {
  Rx<int> deliveryStatusIndex = 0.obs;

  // @override
  // void onInit() {
  //   super.onInit();
  //   print('DeliveryController onInit called');
  //   fetchCartProducts();
  // }

  // Future<List<Product>> fetchCartProducts() async {
  //   print('DeliveryController => fetchFavoriteProducts called ');
  //   return getCartProducts = await ProductService.getCartProducts();
  // }
}
