import 'package:flutter/material.dart';
import 'package:flutter_shop/data/productData.dart';
import 'package:flutter_shop/provider/productProvider.dart';
import 'package:flutter_shop/provider/shoppingCartProvider.dart';
import 'package:flutter_shop/widgets/menu.dart';
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
    final shoppingCartProvider = Provider.of<ShoppingCartProvider>(context);

    return Scaffold(
      drawer: const Menu(),
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
          buildIconWithBadge(shoppingCartProvider.cartDataList.length),
        ],
      ),
      body: GridView.count(crossAxisCount: 2, children: [
        for (var product in products
            .where((product) => !showOnlyFavourites || product.isFavourite))
          ProductPreview(productData: product)
      ]),
    );
  }

  Widget buildIconWithBadge(int badgeNumber) {
    return Stack(
      children: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.pushNamed(context, "/cart");
          },
        ),
        Positioned(
          right: 5,
          top: 0,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.orange, // Choose your desired color
            ),
            child: Text(
              badgeNumber.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
