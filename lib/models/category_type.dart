import 'package:bazar/models/product.dart';
import 'package:bazar/models/types.dart';

class CategoryType {
  final List<Product> product;
  final Types type;

  CategoryType(
    this.product,
    this.type,
  );
}
