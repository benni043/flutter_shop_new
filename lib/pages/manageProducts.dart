import 'package:flutter/material.dart';
import 'package:flutter_shop/data/productData.dart';
import 'package:provider/provider.dart';

import '../provider/productProvider.dart';
import '../widgets/menu.dart';
import '../widgets/editProductPreview.dart';
import 'editProduct.dart';

class ManageProducts extends StatefulWidget {
  const ManageProducts({super.key});

  @override
  State<ManageProducts> createState() => _ManageProductsState();
}

class _ManageProductsState extends State<ManageProducts> {
  late ProductProvider productProvider;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ProductProvider productProvider =
        Provider.of<ProductProvider>(context);

    return Scaffold(
      drawer: const Menu(),
      appBar: AppBar(title: const Text("Produkte anpassen"), actions: [
        IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EditProduct()));
            },
            icon: const Icon(Icons.add))
      ]),
      body: Column(
        children: [
          for (var product in productProvider.productDataList)
            Container(
                margin: const EdgeInsets.all(5),
                child: EditProductPreview(productData: product, remove: remove))
        ],
      ),
    );
  }

  void remove(ProductData productData) {
    final ProductProvider productProvider =
        Provider.of<ProductProvider>(context, listen: false);

    productProvider.remove(productData);
  }
}
