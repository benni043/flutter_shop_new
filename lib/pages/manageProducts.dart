import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/productProvider.dart';
import '../widgets/drawer2.dart';
import '../widgets/editProduct.dart';

class ManageProducts extends StatelessWidget {
  const ManageProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductProvider>(context).productDataList;

    return Scaffold(
      drawer: const Drawer2(),
      appBar: AppBar(title: const Text("Produkte anpassen")),
      body: Column(
        children: [
          for (var product in products) EditProduct(productData: product)
        ],
      ),
    );
  }
}
