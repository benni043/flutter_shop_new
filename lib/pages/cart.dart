import 'package:flutter/material.dart';
import 'package:flutter_shop/data/orderData.dart';
import 'package:flutter_shop/provider/orderProvider.dart';
import 'package:flutter_shop/widgets/shoppingCartProductPreview.dart';
import 'package:provider/provider.dart';

import '../provider/shoppingCartProvider.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    final ShoppingCartProvider shoppingCartProvider =
        Provider.of<ShoppingCartProvider>(context);

    final OrderProvider orderProvider = Provider.of<OrderProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Warenkorb")),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Gesamt: ${shoppingCartProvider.getSumOfAllPrices()}€",
                      style: const TextStyle(fontSize: 20)),
                  TextButton(
                      onPressed: () {
                        if (shoppingCartProvider.cartDataList.isEmpty) return;

                        OrderData orderData = OrderData(
                            shoppingCartProvider.getSumOfAllPrices(),
                            DateTime.now(),
                            List.from(shoppingCartProvider.cartDataList));

                        orderProvider.add(orderData);

                        shoppingCartProvider.clear();
                      },
                      child: const Text("Bestellen",
                          style: TextStyle(fontSize: 20)))
                ],
              )),
          for (var elem in shoppingCartProvider.cartDataList)
            ShoppingCartProductPreview(cartData: elem)
        ],
      ),
    );
  }
}
