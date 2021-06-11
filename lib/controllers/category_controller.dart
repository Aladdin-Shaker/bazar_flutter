import 'package:bazar/models/category.dart';
import 'package:bazar/services/category_service.dart';
import 'package:get/state_manager.dart';

class CategoryController extends GetxController with StateMixin {
  static final allCategories = Future.value(<Categories>[]).obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllCategories();
  }

  Future<List<Categories>?> fetchAllCategories() async {
    allCategories.value = CategoryService.getAllCategories();
    update();
  }
}
