import 'package:flutter/material.dart';
import 'package:flutter_shop/data/productData.dart';
import 'package:flutter_shop/pages/editProduct.dart';

class EditProductPreview extends StatelessWidget {
  final ProductData productData;
  final Function remove;

  const EditProductPreview(
      {super.key, required this.productData, required this.remove});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(productData.productName),
      leading: Image.network(productData.imageURL, width: 100),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                EditProduct(productData: productData)))
                  },
              icon: const Icon(Icons.edit)),
          const SizedBox(width: 16),
          IconButton(
              onPressed: () => {remove(productData)},
              icon: const Icon(Icons.delete)),
        ],
      ),
    );
  }
}
