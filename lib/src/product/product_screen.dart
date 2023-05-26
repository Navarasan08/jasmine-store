import 'package:flutter/material.dart';
import 'package:jasmine_app/src/product/product_detail_screen.dart';
import 'package:jasmine_app/src/shop_widgets/product_card.dart';

import '../../util/constants.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Image.asset(
          AssetManager.logo,
          width: MediaQuery.of(context).size.width / 2,
        ),
      ),
      body: GridView.builder(
        itemCount: 5,
        padding: EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Set the number of items per row
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.6,
        ),
        itemBuilder: (BuildContext context, int index) {
          return ProductCard(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailScreen(),
                    ));
              },
              image:
                  "https://freepngimg.com/download/dress_shirt/7-2-dress-shirt-png-hd.png",
              name: "Men's Classic Collar Slim Fit Cotton Casual Full Shirt",
              price: 474,
              rating: 3.0,
              // oldPrice: 2499,
              // offPercent: 81,
              );
        })
    );
  }
}
