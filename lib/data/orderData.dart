import 'cartData.dart';

class OrderData {
  double _totalPrice;
  DateTime _dateTime;
  List<CartData> _boughtObjects;

  OrderData(this._totalPrice, this._dateTime, this._boughtObjects);

  List<CartData> get boughtObjects => _boughtObjects;

  set boughtObjects(List<CartData> value) {
    _boughtObjects = value;
  }

  DateTime get dateTime => _dateTime;

  set dateTime(DateTime value) {
    _dateTime = value;
  }

  double get totalPrice => _totalPrice;

  set totalPrice(double value) {
    _totalPrice = value;
  }
}