import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:oop_system_homework/Models/Category.dart';

class CategoryDetailWiget extends StatelessWidget {
  CategoryDetailWiget({super.key, required this.category});

  ProductCategory category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: Text("Kategori"), backgroundColor: Colors.blueGrey),
        body: Container(
          child: Center(
            child: Column(
              children: [
                Padding(padding: const EdgeInsets.only(top: 15)),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(category.Id.toString()),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(category.Name.toString()),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(category.product.toString()),
                ),
              ],
            ),
          ),
        ));
  }
}
