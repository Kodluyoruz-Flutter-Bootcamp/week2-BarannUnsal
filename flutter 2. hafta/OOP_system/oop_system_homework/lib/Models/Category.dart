import 'package:flutter/src/material/dropdown.dart';

import 'Product.dart';

class ProductCategory {
  int? Id;
  String? Name;
  List<Product>? product;

  List<ProductCategory> categories = List.empty();

  bool addCategory(ProductCategory category) {
    categories.add(category);
    return true;
  }

  ProductCategory getCategory(int id) {
    return categories.firstWhere((c) => c.Id == id);
  }

  static map(
      DropdownMenuItem<ProductCategory> Function(ProductCategory value)
          param0) {}
}
