import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/data/cartData.dart';
import 'package:flutter_shop/data/productData.dart';

class ShoppingCartProvider extends ChangeNotifier {
  final List<CartData> _cartDataList = [];

  List<CartData> get cartDataList => _cartDataList;

  void add(CartData cartData) {
    _cartDataList.add(cartData);
    notifyListeners();
  }

  void remove(CartData cartData) {
    _cartDataList.remove(cartData);
    notifyListeners();
  }

  void changeCount(ProductData productData, int count) {
    for (var value in cartDataList) {
      if (value.productData == productData) {
        value.count += count;
      }
    }
    notifyListeners();
  }

  void reduce(ProductData productData) {
    for (var value in cartDataList) {
      if (value.productData == productData) {
        if (value.count == 1) {
          remove(value);
        } else {
          changeCount(productData, -1);
        }
      }
    }
  }

  void clear() {
    cartDataList.clear();
    notifyListeners();
  }

  bool hasProduct(ProductData productData) {
    for (var value in cartDataList) {
      if (value.productData == productData) return true;
    }

    return false;
  }

  double getSumOfAllPrices() {
    double val = 0;

    for (var value in cartDataList) {
      val += value.productData.price * value.count;
    }

    return val;
  }
}
