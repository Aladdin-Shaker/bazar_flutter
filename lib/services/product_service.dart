import 'package:bazar/models/product.dart';
import 'package:get/state_manager.dart';

class ProductService extends GetxService {
  static Future<List<Product>> getProducts() async {
    return Future.delayed(const Duration(seconds: 1), () {
      final List<Product> products = [
        Product('Smart Warch', 125.0, 199.0, 4.5, true,
            "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fs3-ap-southeast-1.amazonaws.com%2Fa2.datacaciques.com%2F17%2F01%2F18%2F2099q9579cv015c0%2Fe31c62f1a809c516.jpg&f=1&nofb=1"),
        Product('Smart Warch', 125.0, 199.0, 4.5, false,
            "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fs3-ap-southeast-1.amazonaws.com%2Fa2.datacaciques.com%2F17%2F01%2F18%2F2099q9579cv015c0%2Fe31c62f1a809c516.jpg&f=1&nofb=1"),
        Product('Smart Warch', 125.0, 199.0, 4.5, true,
            "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fs3-ap-southeast-1.amazonaws.com%2Fa2.datacaciques.com%2F17%2F01%2F18%2F2099q9579cv015c0%2Fe31c62f1a809c516.jpg&f=1&nofb=1"),
      ];
      return products;
    });
  }

  static Future<List<Product>> getNewArrivalProducts() async {
    return Future.delayed(const Duration(seconds: 1), () {
      final List<Product> newArrival = [
        Product('Super Flash Sale \n50% off', 125.0, 199.0, 4.5, true,
            "https://www.slrlounge.com/wp-content/uploads/2016/08/product-photography-raw-image-800x534.jpg"),
        Product('Super Flash Sale \n50% off', 125.0, 199.0, 4.5, true,
            "https://www.slrlounge.com/wp-content/uploads/2016/08/product-photography-raw-image-800x534.jpg"),
        Product('Super Flash Sale \n50% off', 125.0, 199.0, 4.5, true,
            "https://www.slrlounge.com/wp-content/uploads/2016/08/product-photography-raw-image-800x534.jpg"),
      ];

      return newArrival;
    });
  }
}
