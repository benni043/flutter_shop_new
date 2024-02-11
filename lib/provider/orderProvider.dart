import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/data/orderData.dart';

class OrderProvider extends ChangeNotifier {
  final List<OrderData> _orderDataList = [];

  List<OrderData> get orderDataList => _orderDataList;

  void add(OrderData orderData) {
    orderDataList.add(orderData);
    notifyListeners();
  }

}
