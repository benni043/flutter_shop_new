import 'package:flutter/material.dart';
import 'package:flutter_shop/data/cartData.dart';
import 'package:provider/provider.dart';

import '../provider/shoppingCartProvider.dart';

class ShoppingCartProductPreview extends StatefulWidget {
  final CartData cartData;

  const ShoppingCartProductPreview({super.key, required this.cartData});

  @override
  State<ShoppingCartProductPreview> createState() => _ShoppingCartProductPreviewState();
}

class _ShoppingCartProductPreviewState extends State<ShoppingCartProductPreview> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: Key(widget.cartData.productData.productName),
        onDismissed: (direction) {
          final ShoppingCartProvider shoppingCartProvider =
              Provider.of<ShoppingCartProvider>(context, listen: false);

          setState(() {
            shoppingCartProvider.remove(widget.cartData);
          });
        },
        background: Container(
          color: Colors.red,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20.0),
          child: const Icon(Icons.delete),
        ),
        child: ListTile(
            title: Text(widget.cartData.productData.productName),
            subtitle:
                Text("Summe: ${widget.cartData.productData.price * widget.cartData.count}€"),
            leading: Image.network(widget.cartData.productData.imageURL, width: 100),
            trailing: Text("${widget.cartData.count} x")));
  }
}
