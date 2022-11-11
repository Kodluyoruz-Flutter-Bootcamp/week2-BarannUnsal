import 'package:flutter/material.dart';
import 'package:oop_system_homework/Screens/CategoryScreen/CategoryDetailWiget.dart';
import 'package:oop_system_homework/Screens/CategoryScreen/CategoryOperationPage.dart';
import 'package:oop_system_homework/Screens/ProductOperationPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Mini Flutter E-Ticaret"),
            backgroundColor: Colors.blueGrey),
        body: Container(
          child: Center(
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.only(top: 15)),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blueGrey),
                    ),
                    onPressed: () {
                      _navigateToProductScreen(context);
                    },
                    child: const Text("Ürün Sayfası",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blueGrey),
                    ),
                    onPressed: () {
                      _navigateToCategoryScreen(context);
                    },
                    child: const Text("Kategori Sayfası",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void _navigateToProductScreen(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const ProductOperationPage()));
  }

  void _navigateToCategoryScreen(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const CategoryOperationPage()));
  }
}
