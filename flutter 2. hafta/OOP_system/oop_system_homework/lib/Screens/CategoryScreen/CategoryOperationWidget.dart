import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:oop_system_homework/Models/Category.dart';
import 'package:oop_system_homework/Screens/CategoryScreen/CategoryDetailWiget.dart';

class CategoryOperationWidget extends StatefulWidget {
  const CategoryOperationWidget({super.key});

  @override
  State<CategoryOperationWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CategoryOperationWidget> {
  TextEditingController categoryId = TextEditingController();
  TextEditingController categoryName = TextEditingController();

  List<ProductCategory> categories = <ProductCategory>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Kategori Ekle"), backgroundColor: Colors.blueGrey),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.number,
                controller: categoryId,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                    ),
                    hintText: 'Id Giriniz'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: TextField(
                  controller: categoryName,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(2)),
                      ),
                      hintText: 'Ürün Adı Giriniz'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: addCategory,
                  child: Text("Kategori ekle"),
                ),
              ),
              !categories.isEmpty
                  ? Container(
                      height: 250,
                      child: ListView.builder(
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return Center(
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: ListTile(
                                  title:
                                      Text(categories[index].Name.toString()),
                                  leading: Icon(Icons.category),
                                  trailing: Icon(Icons.arrow_forward),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              CategoryDetailWiget(
                                                  category: categories[index]),
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

  addCategory() {
    ProductCategory category = new ProductCategory();

    category.Id = int.parse(categoryId.text.toString());
    category.Name = categoryName.text.toString();

    setState(() {
      categories.add(category);
      categoryId.text = "";
      categoryName.text = "";
    });
  }
}
