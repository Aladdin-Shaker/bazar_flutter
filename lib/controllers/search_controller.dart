import 'package:bazar/models/product.dart';
import 'package:bazar/services/product_service.dart';
import 'package:get/state_manager.dart';

class SearchController extends GetxController with StateMixin {
  List<Product> futureAllProducts = <Product>[];

  @override
  void onInit() {
    super.onInit();
    fetchAllProducts();
  }

  Future<List<Product>> fetchAllProducts() async {
    print('fetchAllProducts called ');

    return futureAllProducts = await ProductService.getAllProducts();

    // update();
  }
}
