import 'package:oop_system_homework/Enums/CategoryEnum.dart';
import 'package:oop_system_homework/Models/Category.dart';

class Product {
  int? Id;
  String? name;
  double? price;
  CategoryEnum? Category;

  List<Product> products = List.empty();

  bool addProduct(Product product) {
    products.add(product);
    return true;
  }

  Product getProduct(int id) {
    return products.firstWhere((p) => p.Id == id);
  }
}
