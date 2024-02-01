import 'package:flutter/material.dart';
import 'package:flutter_shop/data/productData.dart';

class EditProduct extends StatelessWidget {
  final ProductData productData;

  const EditProduct({super.key, required this.productData});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(productData.productName),
      leading: Image.network(productData.imageURL),
      trailing: Icon(Icons.edit),
    );
  }
}
