class ProductData {
  late String _productName;
  late String _description;
  late String _imageURL;
  late double _price;

  late bool _isFavourite;

  ProductData(
      this._productName, this._description, this._imageURL, this._price, this._isFavourite);

  bool get isFavourite => _isFavourite;

  set isFavourite(bool value) {
    _isFavourite = value;
  }

  double get price => _price;

  set price(double value) {
    _price = value;
  }

  String get imageURL => _imageURL;

  set imageURL(String value) {
    _imageURL = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  String get productName => _productName;

  set productName(String value) {
    _productName = value;
  }
}
