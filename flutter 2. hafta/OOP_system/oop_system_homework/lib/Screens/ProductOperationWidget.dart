import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:oop_system_homework/Enums/CategoryEnum.dart';
import 'package:oop_system_homework/Models/Category.dart';
import 'package:oop_system_homework/Models/Product.dart';

import 'ProductDetailWidget.dart';

class ProductOperationWidget extends StatefulWidget {
  const ProductOperationWidget({super.key});

  @override
  State<ProductOperationWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ProductOperationWidget> {
  TextEditingController productName = TextEditingController();
  TextEditingController productPrice = TextEditingController();
  TextEditingController productId = TextEditingController();
  TextEditingController category = TextEditingController();

  List<ProductCategory>? listCategory;
  CategoryEnum? categories;

  List<Product> products = <Product>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text("Ürün Ekle"), backgroundColor: Colors.blueGrey),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.number,
                controller: productId,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                    ),
                    hintText: 'Id Giriniz'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: TextField(
                  controller: productName,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(2)),
                      ),
                      hintText: 'Ürün Adı Giriniz'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: productPrice,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(2)),
                      ),
                      hintText: 'Fiyat Giriniz'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: DropdownButton<CategoryEnum>(
                  hint: Text('Kategori Seçiniz',
                      style: TextStyle(
                          fontSize: 14, color: Colors.amber.shade900)),
                  value: categories,
                  items: CategoryEnum.values
                      .map((CategoryEnum value) =>
                          DropdownMenuItem<CategoryEnum>(
                            value: value,
                            child: Text(
                              value.name.toString(),
                              style: const TextStyle(fontSize: 14),
                            ),
                          ))
                      .toList(),
                  onChanged: (CategoryEnum? value) {
                    setState(() {
                      categories = value as CategoryEnum;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: addProduct,
                  child: Text("Ürün ekle"),
                ),
              ),
              !products.isEmpty
                  ? Container(
                      height: 250,
                      child: ListView.builder(
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            return Center(
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: ListTile(
                                  title: Text(products[index].name.toString()),
                                  subtitle:
                                      Text(products[index].price.toString()),
                                  leading:
                                      Icon(Icons.production_quantity_limits),
                                  trailing: Icon(Icons.arrow_forward),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ProductDetailWidget(
                                                  product: products[index]),
                                        ));
                                  },
                                ),
                              ),
                            );
                          }),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  addProduct() {
    Product product = new Product();

    product.Id = int.parse(productId.text.toString());
    product.name = productName.text.toString();
    product.price = double.parse(productPrice.text.toString());
    product.Category = categories;

    setState(() {
      products.add(product);
      productId.text = "";
      productName.text = "";
      productPrice.text = "";
      product.Category = null;
    });
  }
}
