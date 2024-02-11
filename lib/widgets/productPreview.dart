import 'package:flutter/material.dart';
import 'package:flutter_shop/data/cartData.dart';
import 'package:flutter_shop/provider/shoppingCartProvider.dart';
import 'package:provider/provider.dart';
import '../data/productData.dart';

class ProductPreview extends StatefulWidget {
  final ProductData productData;

  const ProductPreview({super.key, required this.productData});

  @override
  State<ProductPreview> createState() => _ProductPreviewState();
}

class _ProductPreviewState extends State<ProductPreview> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.pushNamed(context, "/product", arguments: widget.productData)
      },
      child: GridTile(
        footer: Container(
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.8),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          margin:
              const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () => {
                  setState(() {
                    widget.productData.isFavourite =
                        !widget.productData.isFavourite;
                  })
                },
                icon: widget.productData.isFavourite
                    ? const Icon(Icons.favorite, color: Colors.white)
                    : const Icon(Icons.favorite_border, color: Colors.white),
              ),
              Text(
                widget.productData.productName,
                style: const TextStyle(color: Colors.white),
              ),
              IconButton(
                onPressed: () {
                  final ShoppingCartProvider shoppingCartProvider =
                      Provider.of<ShoppingCartProvider>(context, listen: false);

                  if (!shoppingCartProvider.hasProduct(widget.productData)) {
                    shoppingCartProvider.add(CartData(widget.productData, 1));
                  } else {
                    shoppingCartProvider.changeCount(widget.productData, 1);
                  }

                  final snackBar = SnackBar(
                    content: Row(
                      children: [
                        Text("${widget.productData.productName} hinzugefügt!"),
                        //todo undo
                        TextButton(
                            onPressed: () {
                              shoppingCartProvider.reduce(widget.productData);
                              ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            },
                            child: const Text("undo"))
                      ],
                    ),
                    duration: const Duration(seconds: 2),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                icon: const Icon(Icons.shopping_cart, color: Colors.white),
              ),
            ],
          ),
        ),
        child: Image.network(widget.productData.imageURL),
      ),
    );
  }
}
