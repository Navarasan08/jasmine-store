import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.image, required this.name, required this.price, required this.rating, required this.oldPrice, required this.offPercent});

  final String image;
  final String name;
  final int price;
  final double rating;
  final int oldPrice;
  final int offPercent;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          children: [
            Expanded(
                flex: 4,
                child: Image.network(
                    image)),
            SizedBox(height: 5),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  Flexible(
                    child: Text(
                      name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            for (var i in [1, 2, 3, 4, 5])
                              Icon(Icons.star,
                                  size: 15, color: Color(0xffffa41f)),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "₹ $price",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          SizedBox(width: 5),
                          Text("₹ $oldPrice",
                              style: TextStyle(
                                  fontSize: 11,
                                  decoration: TextDecoration.lineThrough)),
                          SizedBox(width: 3),
                          Text("$offPercent % off",
                              style: TextStyle(fontSize: 11, color: Colors.red))
                        ],
                      )
                    ],
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
