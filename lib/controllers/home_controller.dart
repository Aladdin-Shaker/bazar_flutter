import 'package:bazar/models/category.dart';
import 'package:bazar/models/product.dart';
import 'package:bazar/services/category_service.dart';
import 'package:bazar/services/product_service.dart';
import 'package:get/state_manager.dart';

class HomeController extends GetxController with StateMixin {
  static final futureCategories = Future.value(<Categories>[]).obs;
  static final futureProducts = Future.value(<Product>[]).obs;
  static final newArrivalProducts = Future.value(<Product>[]).obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
    fetchProducts();
    fetchNewArrivalProducts();
  }

  Future<List<Categories>?> fetchCategories() async {
    futureCategories.value = CategoryService.getCategories();
    update();
  }

  Future<List<Product>?> fetchProducts() async {
    print('fetchProducts called');
    futureProducts.value = ProductService.getProducts();
    // change(futureProducts, status: RxStatus.success());
    update();
  }

  Future<List<Product>?> fetchNewArrivalProducts() async {
    print('fetchNewArrivalProducts called');
    newArrivalProducts.value = ProductService.getNewArrivalProducts();
    update();
  }
}
