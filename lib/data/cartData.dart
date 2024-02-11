import 'package:flutter_shop/data/productData.dart';

class CartData {
  ProductData _productData;
  int _count;

  CartData(this._productData, this._count);

  int get count => _count;

  set count(int value) {
    _count = value;
  }

  ProductData get productData => _productData;

  set productData(ProductData value) {
    _productData = value;
  }
}
