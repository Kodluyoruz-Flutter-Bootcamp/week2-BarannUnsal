import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:oop_system_homework/Models/Product.dart';

class ProductDetailWidget extends StatelessWidget {
  ProductDetailWidget({super.key, required this.product});

  Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Ürün"), backgroundColor: Colors.blueGrey),
        body: Container(
          child: Center(
            child: Column(
              children: [
                Padding(padding: const EdgeInsets.only(top: 15)),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(product.Id.toString()),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(product.name.toString()),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(product.price.toString()),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(product.Category.toString()),
                ),
              ],
            ),
          ),
        ));
  }
}
