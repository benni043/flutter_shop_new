import 'package:flutter/material.dart';
import 'package:flutter_shop/widgets/order.dart';
import 'package:provider/provider.dart';
import '../provider/orderProvider.dart';
import '../widgets/menu.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderProvider orderProvider = Provider.of<OrderProvider>(context);
    
    return Scaffold(
      drawer: const Menu(),
      appBar: AppBar(title: const Text("Bestellungen")),
      body: Column(
        children: [
          for (var elem in orderProvider.orderDataList)
            Order(orderData: elem)
        ],
      )
    );
  }
}
