import 'package:flutter/material.dart';
import 'package:jasmine_app/src/cart/summary_screen.dart';

import '../../util/constants.dart';
import '../../widget/custom_button.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void goToBuyNow() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SummaryScreen()));
  }

  void deleteItemTapped() {}
  void saveForLaterTapped() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navigator.canPop(context)
          ? AppBar(
              title: Image.asset(
                AssetManager.logo,
                width: MediaQuery.of(context).size.width / 2,
              ),
            )
          : null,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _cartItem(),
                    _cartItem(),
                    _cartItem(),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: CustomSubmitButton(
                title: "Buy Now",
                onPressed: goToBuyNow,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cartItem() {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          child: Row(
            children: [
              Card(
                child: Container(
                  height: 150,
                  width: size.width * 0.3,
                  child: Image.network(
                      "https://freepngimg.com/download/dress_shirt/7-2-dress-shirt-png-hd.png"),
                ),
              ),
              SizedBox(width: 10),
              Flexible(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Men's Classic Collar Slim Fit Cotton Casual Full Shirt",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(height: 5),
                  Text("XL x 1"),
                  SizedBox(height: 5),
                  Text("₹ 200.00"),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      TextButton(
                          onPressed: deleteItemTapped, child: Text("Delete")),
                      TextButton(
                          onPressed: saveForLaterTapped,
                          child: Text("Move to Wishlist")),
                    ],
                  ),
                  // SizedBox(height: 10),
                ],
              )),
            ],
          ),
        ),
        Divider(),
      ],
    );
  }

  Widget noItemsWidget() {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(
          Icons.shopping_bag_outlined,
          color: Colors.red,
          size: 30,
        ),
        SizedBox(height: 10),
        Text("No Items in Bag.. Add More"),
      ]),
    );
  }
}
