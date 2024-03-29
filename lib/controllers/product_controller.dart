import 'package:bazar/models/category_type.dart';
import 'package:bazar/models/product.dart';
import 'package:bazar/services/product_service.dart';
import 'package:get/state_manager.dart';

class ProductController extends GetxController with StateMixin {
  RxList<CategoryType> allExpansionProducts = <CategoryType>[].obs;
  List<Product> getFavoriteProduct = <Product>[];

  @override
  void onInit() {
    super.onInit();
    print('ProductController onInit called');
    fetchAllExpansionProducts();
  }

  fetchAllExpansionProducts() async {
    print('fetchAllExpansionProducts called ');
    final data = await ProductService.getTypes();
    allExpansionProducts.value = data;
  }

  Future<List<Product>> fetchFavoriteProducts() async {
    print('PRODUCTs_CTRL => fetchFavoriteProducts called ');
    return getFavoriteProduct = await ProductService.getFavoriteProducts();
  }
}
