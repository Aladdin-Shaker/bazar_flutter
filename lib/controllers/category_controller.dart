import 'package:bazar/models/category.dart';
import 'package:bazar/services/category_service.dart';
import 'package:get/state_manager.dart';

class CategoryController extends GetxController with StateMixin {
  RxList<Categories> allCategories = RxList<Categories>();
  @override
  void onInit() {
    super.onInit();
    fetchAllCategories();
  }

  Future<void> fetchAllCategories() async {
    return CategoryService.getAllCategories()
        .then((response) {
          allCategories.value = response;
        })
        .catchError((err) => print('Error!!!!! : $err'))
        .whenComplete(() => print('completed'));
  }
}
