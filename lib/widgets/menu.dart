import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    textStyle: const TextStyle(fontSize: 20)),
                onPressed: () => Navigator.pushNamed(context, "/"),
                child: Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(right: 20),
                        child: const Icon(Icons.shop)),
                    const Text("Shop")
                  ],
                )),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    textStyle: const TextStyle(fontSize: 20)),
                onPressed: () => Navigator.pushNamed(context, "/orders"),
                child: Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(right: 20),
                        child: const Icon(Icons.credit_card)),
                    const Text("Bestellungen")
                  ],
                )),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    textStyle: const TextStyle(fontSize: 20)),
                onPressed: () =>
                    Navigator.pushNamed(context, "/manageProducts"),
                child: Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(right: 20),
                        child: const Icon(Icons.edit)),
                    const Text("Produkte anpassen")
                  ],
                )),
          )
        ],
      ),
    );
  }
}
