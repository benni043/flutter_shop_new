import 'package:flutter/material.dart';
import 'package:flutter_shop/data/productData.dart';

class EditProduct extends StatefulWidget {
  ProductData productData;

  EditProduct({super.key, required this.productData});

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: 250,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Name"),
              ),
            ),
            SizedBox(
              width: 250,
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Preis"),
              ),
            ),
            SizedBox(
              width: 250,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Beschreibung"),
              ),
            ),
            SizedBox(
              width: 250,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Bild-URL"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
