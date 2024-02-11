import 'package:flutter/material.dart';
import 'package:flutter_shop/data/productData.dart';
import 'package:flutter_shop/provider/productProvider.dart';
import 'package:flutter_shop/widgets/drawer2.dart';
import 'package:flutter_shop/widgets/productPreview.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool showOnlyFavourites = false;

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductProvider>(context).productDataList;

    return Scaffold(
      drawer: const Drawer2(),
      appBar: AppBar(
        title: const Text("Produkte"),
        actions: [
          PopupMenuButton<bool>(
            onSelected: (value) {
              setState(() {
                showOnlyFavourites = value;
              });
            },
            itemBuilder: (context) => [
              const PopupMenuItem<bool>(
                  value: true, child: Text("nur Favouriten")),
              const PopupMenuItem<bool>(value: false, child: Text("alle"))
            ],
          ),
          IconButton(
              onPressed: () => Navigator.pushNamed(context, "/cart"),
              icon: const Icon(Icons.shopping_cart)),
        ],
      ),
      body: GridView.count(crossAxisCount: 2, children: [
        for (var product in products
            .where((product) => !showOnlyFavourites || product.isFavourite))
          ProductPreview(productData: product)
      ]),
    );
  }
}
