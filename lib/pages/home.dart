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

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductProvider>(context).productDataList;

    return Scaffold(
      drawer: const Drawer2(),
      appBar: AppBar(
        title: const Text("Produkte"),
        actions: [
          IconButton(
              onPressed: () => {_showPopupMenu(context)},
              icon: const Icon(Icons.more_vert)),
          IconButton(
              onPressed: () => Navigator.pushNamed(context, "/cart"),
              icon: const Icon(Icons.shopping_cart)),
        ],
      ),
      body: GridView.count(crossAxisCount: 2, children: [
        for (var product in products) ProductPreview(productData: product)
      ]),
    );
  }

  void _showPopupMenu(BuildContext context) async {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;

    await showMenu(
      context: context,
      position: RelativeRect.fromRect(
        Rect.fromPoints(
          Offset.zero,
          overlay.localToGlobal(overlay.size.bottomRight(Offset.zero)),
        ),
        Offset.zero & overlay.size,
      ),
      items: [
        PopupMenuItem(
          value: "Nur markierte",
          child: const Text("Nur markierte"),
          onTap: () => {print("nur markierte")},
        ),
        PopupMenuItem(
          value: "Alle",
          child: const Text("Alle"),
          onTap: () => {print("alle")},
        ),
      ],
    );
  }
}
