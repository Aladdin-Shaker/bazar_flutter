import 'package:bazar/models/product.dart';
import 'package:bazar/services/product_service.dart';
import 'package:get/state_manager.dart';

class FavoriteController extends GetxController {
  List<Product> getFavoriteProduct = <Product>[];

  @override
  void onInit() {
    super.onInit();
    print('ProductController onInit called');
    fetchFavoriteProducts();
  }

  Future<List<Product>> fetchFavoriteProducts() async {
    print('PRODUCTs_CTRL => fetchFavoriteProducts called ');
    return getFavoriteProduct = await ProductService.getFavoriteProducts();
  }
}
