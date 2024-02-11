import 'package:flutter/material.dart';
import 'package:flutter_shop/data/orderData.dart';

class Order extends StatelessWidget {
  final OrderData orderData;

  const Order({super.key, required this.orderData});

  @override
  Widget build(BuildContext context) {
    print(orderData.boughtObjects);
    return ExpansionTile(
        title: Text("${orderData.totalPrice}€"),
        subtitle: Text("${orderData.dateTime}"),
        children: <Widget>[
          for (var value in orderData.boughtObjects)
            ListTile(
              title: Text(value.productData.productName),
              trailing: Text("${value.count}x ${value.productData.price}€"),
            )
        ]);
  }
}
