import 'package:flutter/material.dart';
import '../widgets/drawer2.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer2(),
      appBar: AppBar(title: const Text("Bestellungen")),
      body: Text("Bestselling")
    );
  }
}
