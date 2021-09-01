import 'package:bazar/models/category_type.dart';
import 'package:bazar/models/product.dart';
import 'package:bazar/services/product_service.dart';
import 'package:get/state_manager.dart';

class CartController extends GetxController {
  List<Product> getCartProducts = <Product>[];

  // @override
  // void onInit() {
  //   super.onInit();
  //   print('CartController onInit called');
  //   fetchCartProducts();
  // }

  Future<List<Product>> fetchCartProducts() async {
    print('CartController => fetchFavoriteProducts called ');
    return getCartProducts = await ProductService.getCartProducts();
  }
}
