import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/cart.dart';
import 'package:flutter_shop/pages/home.dart';
import 'package:flutter_shop/pages/manageProducts.dart';
import 'package:flutter_shop/pages/orders.dart';
import 'package:flutter_shop/pages/product.dart';
import 'package:flutter_shop/provider/productProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
      ],
      child: MaterialApp(
        title: '05_FlutterShop',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: "/",
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => const Home(),
          "/orders": (context) => const Orders(),
          "/manageProducts": (context) => const ManageProducts(),
          "/product": (context) => const Product(),
          "/cart": (context) => const Cart(),
        },
      ),
    );
  }
}
