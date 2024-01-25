import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/data/productData.dart';
import 'package:flutter_shop/widgets/product.dart';
import 'package:flutter_shop/widgets/productPreview.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ProductData> products = [];

  @override
  void initState() {
    super.initState();
    var product = ProductData(
        "IPhone 15 Pro",
        "new newest IPhone model",
        "https://cdn.dxomark.com/wp-content/uploads/medias/post-125834/Apple-iPhone-14_FINAL_featured-image-packshot-review.jpg",
        1199.00,
        false);

    products.add(product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        for (var product in products) ProductPreview(productData: product)
      ]),
    );
  }
}
