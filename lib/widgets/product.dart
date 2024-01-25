import 'package:flutter/material.dart';
import 'package:flutter_shop/data/productData.dart';

class Product extends StatelessWidget {
  final ProductData productData;

  const Product({super.key, required this.productData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productData.productName),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(productData.imageURL),
            Text(productData.price as String),
            Text(productData.description),
          ],
        ),
      ),
    );
  }
}
