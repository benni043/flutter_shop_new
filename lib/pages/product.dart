import 'package:flutter/material.dart';
import 'package:flutter_shop/data/productData.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  late ProductData productData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    try {
      productData = ModalRoute.of(context)!.settings.arguments as ProductData;
    } catch (e) {
      productData =
          ProductData("_productName", "_description", "_imageURL", 1, false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productData.productName),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(productData.imageURL),
                Text("${productData.price.toString()} €", style: const TextStyle(fontSize: 20)),
                Text(productData.description, style: const TextStyle(fontSize: 20)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
