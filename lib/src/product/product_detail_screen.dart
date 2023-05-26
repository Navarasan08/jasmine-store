import 'package:flutter/material.dart';
import 'package:jasmine_app/src/shop_widgets/product_carousel.dart';
import 'package:jasmine_app/util/constants.dart';
import 'package:jasmine_app/widget/custom_button.dart';
import 'package:jasmine_app/widget/custom_footer.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          AssetManager.logo,
          width: MediaQuery.of(context).size.width / 2,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ProductCarousel(
            carouselType: CarouselType.productShowcase,
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Men's Classic Collar Slim Fit Cotton Casual Full Shirt",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10),
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
                      SizedBox(width: 10),
                      Text("5.0"),
                      Spacer(),
                      Text(
                        "2 Reviews",
                        style: TextStyle(color: Colors.green),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black26)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Quantity Available: 25",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Text("L: 10"),
                              SizedBox(width: 20),
                              Text("XL: 4"),
                              SizedBox(width: 20),
                              Text("XXL: 1"),
                            ],
                          ),
                        ],
                      ),
                    )),
                _titleWidget("Select Size:"),
                Row(
                  children: [
                    for (var size in ["L", "M", "S", "XL", "2XL", "3XL"])
                      Container(
                        width: 35,
                        height: 35,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black38)),
                        child: Center(child: Text(size)),
                      )
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "₹ 474",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                    ),
                    SizedBox(width: 5),
                    if (true) ...[
                      Text("₹ 2499",
                          style: TextStyle(
                              fontSize: 11,
                              decoration: TextDecoration.lineThrough)),
                      SizedBox(width: 3),
                    ],
                    if (true)
                      Text("81 % off",
                          style: TextStyle(fontSize: 11, color: Colors.red))
                  ],
                ),
                Divider(),
                Container(
                  width: double.infinity,
                  child: CustomSubmitButton(
                    title: "Add to Cart",
                    color: Colors.cyan,
                    onPressed: () {},
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: CustomSubmitButton(
                    title: "Buy Now",
                    onPressed: () {},
                  ),
                ),
                Divider(),
                _titleWidget("Product Detail:"),
                _detailWidget("Material", "Cotton"),
                _detailWidget("Style", "Regular"),
                _detailWidget("Neck Style", "ButtonFront"),
                _detailWidget("Pattern", "Solid"),
                SizedBox(height: 10),
                Divider(),
                CustomFooter(),
                SizedBox(height: 40),

              ],
            ),
          )
        ]),
      ),
    );
  }

  Widget _detailWidget(String key, String val) {
    return Row(
      children: [
        Expanded(
            flex: 2,
            child: Text(
              key,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            )),
        SizedBox(width: 5),
        Text(":"),
        SizedBox(width: 5),
        Expanded(
            flex: 4,
            child: Text(
              val,
              style: TextStyle(fontSize: 14),
            )),
      ],
    );
  }

  Widget _titleWidget(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 5.0),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }
}
