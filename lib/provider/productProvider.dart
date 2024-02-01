import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/data/productData.dart';

class ProductProvider extends ChangeNotifier {
  final List<ProductData> _productDataList = [];

  List<ProductData> get productDataList => _productDataList;

  ProductProvider() {
    var product1 = ProductData(
        "IPhone 15 Pro",
        "new newest IPhone model",
        "https://cdn.dxomark.com/wp-content/uploads/medias/post-125834/Apple-iPhone-14_FINAL_featured-image-packshot-review.jpg",
        1199.00,
        false);

    var product2 = ProductData(
        "Galaxy S24 Ultra",
        "new newest Samsung model",
        "https://www.electronic4you.at/media/catalog/product/cache/0/image/1500x/9df78eab33525d08d6e5fb8d27136e95/2/4/247178.jpg",
        1449.00,
        false);

    var product3 = ProductData("Tobias", "Ein sehr alter Tobias",
        "http://store.tobinio.at/file/IMG_3758.PNG", 1.00, false);

    var product4 = ProductData("Fabian", "Ein sehr junger Fabian",
        "http://store.tobinio.at/file/IMG_4029.PNG", 1.00, false);

    _productDataList.add(product1);
    _productDataList.add(product2);
    _productDataList.add(product3);
    _productDataList.add(product4);
  }

  void add(ProductData productData) {
    _productDataList.add(productData);
    notifyListeners();
  }

  void remove(ProductData productData) {
    _productDataList.remove(productData);
    notifyListeners();
  }
}
