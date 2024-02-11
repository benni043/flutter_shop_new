import 'package:flutter/material.dart';
import 'package:flutter_shop/data/productData.dart';
import 'package:provider/provider.dart';

import '../provider/productProvider.dart';

class EditProduct extends StatefulWidget {
  ProductData? productData;

  EditProduct({Key? key, this.productData}) : super(key: key);

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _imageUrl = TextEditingController();

  @override
  void initState() {
    if (widget.productData != null) {
      _name.text = widget.productData!.productName;
      _price.text = widget.productData!.price.toString();
      _description.text = widget.productData!.description;
      _imageUrl.text = widget.productData!.imageURL;
    }

    super.initState();
  }

  void save() {
    if (widget.productData == null) {
      final ProductProvider productProvider =
          Provider.of<ProductProvider>(context, listen: false);

      widget.productData = ProductData(_name.text, _description.text,
          _imageUrl.text, double.parse(_price.text), false);

      productProvider.add(widget.productData!);
    } else {
      widget.productData!.productName = _name.text;
      widget.productData!.price = double.parse(_price.text);
      widget.productData!.description = _description.text;
      widget.productData!.imageURL = _imageUrl.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Produkt bearbeiten"),
        actions: [
          IconButton(
              onPressed: () {
                save();

                Navigator.pushNamed(context, "/manageProducts");
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 250,
                child: TextField(
                  controller: _name,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Name"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 250,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _price,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Preis"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 250,
                child: TextField(
                  controller: _description,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Beschreibung"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 250,
                child: TextField(
                  controller: _imageUrl,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Bild-URL"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
