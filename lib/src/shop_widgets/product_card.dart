import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.onTap,
    this.rating,
    this.oldPrice,
    this.offPercent,
    this.isFavorite = false,
  });

  final String image;
  final String name;
  final int price;
  final double? rating;
  final int? oldPrice;
  final int? offPercent;
  final bool isFavorite;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          children: [
            Expanded(
                child: Stack(
              children: [
                Image.network(image),
                Positioned(
                  top: 5,
                  right: 10,
                  child: CircleAvatar(
                      radius: 13,
                      backgroundColor: Colors.white,
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_outline,
                        size: 14,
                        color: isFavorite ? Colors.red : Colors.black,
                      )),
                )
              ],
            )),
            SizedBox(height: 5),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Text(
                  name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  child: Row(
                    children: [
                      for (var i in [1, 2, 3, 4, 5])
                        Icon(
                          Icons.star,
                          size: 15,
                          color: Color(0xffffa41f),
                          fill: 0.3,
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      "₹ $price",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(width: 5),
                    if (oldPrice != null) ...[
                      Text("₹ $oldPrice",
                          style: TextStyle(
                              fontSize: 11,
                              decoration: TextDecoration.lineThrough)),
                      SizedBox(width: 3),
                    ],
                    if (offPercent != null)
                      Text("$offPercent % off",
                          style: TextStyle(fontSize: 11, color: Colors.red))
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
