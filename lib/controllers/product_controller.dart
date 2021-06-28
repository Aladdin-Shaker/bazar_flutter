import 'package:bazar/models/category_type.dart';
import 'package:bazar/services/product_service.dart';
import 'package:get/state_manager.dart';

class ProductController extends GetxController with StateMixin {
  RxList<CategoryType> allExpansionProducts = <CategoryType>[].obs;

  @override
  void onInit() {
    super.onInit();
    print('ProductController onInit called');
    fetchAllExpansionProducts();
  }

  void fetchAllExpansionProducts() async {
    print('fetchAllExpansionProducts called ');
    final data = await ProductService.getTypes();
    allExpansionProducts.value = data;
  }
}
