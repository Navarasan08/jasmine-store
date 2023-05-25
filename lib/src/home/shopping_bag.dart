import 'package:flutter/material.dart';

class ShoppingBagPage extends StatefulWidget {
  const ShoppingBagPage({super.key});

  @override
  State<ShoppingBagPage> createState() => _ShoppingBagPageState();
}

class _ShoppingBagPageState extends State<ShoppingBagPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
       child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Icon(Icons.shopping_bag_outlined, color: Colors.red, size: 30,),
        SizedBox(height: 10),
        Text("No Items in Bag.. Add More"),

      ]),
    );
  }
}