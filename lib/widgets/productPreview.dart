import 'package:flutter/material.dart';
import '../data/productData.dart';

class ProductPreview extends StatelessWidget {
  final ProductData productData;

  const ProductPreview({super.key, required this.productData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: GridTile(
        footer: SizedBox(
          height: 40,
          child: Row(
            children: [
              IconButton(
                  onPressed: () => {},
                  icon: productData.isFavourite
                      ? const Icon(Icons.favorite)
                      : const Icon(Icons.favorite_border)),
              Center(
                child: Text(productData.productName),
              ),
              IconButton(
                  onPressed: () => {},
                  icon: const Icon(Icons.shopping_basket_sharp)),
            ],
          ),
        ),
        child: Image.network(productData.imageURL),
      ),
    );
  }
}
