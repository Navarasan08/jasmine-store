import 'package:flutter/material.dart';
import 'package:jasmine_app/src/product/product_screen.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  List<Map> categories = [
    {
      "name": "SHIRT",
      "img":
          "https://freepngimg.com/download/dress_shirt/7-2-dress-shirt-png-hd.png",
    },
    {
      "name": "PANT",
      "img":
          "https://e7.pngegg.com/pngimages/556/869/png-clipart-seven-stacked-blue-denim-bottoms-jeans-t-shirt-trousers-slim-fit-pants-clothing-men-s-jeans-tshirt-zipper.png",
    },
    {
      "name": "T-SHIRT",
      "img":
          "https://static.vecteezy.com/system/resources/previews/008/847/318/original/isolated-black-t-shirt-front-free-png.png",
    },
    {
      "name": "TRACK PANT",
      "img":
          "https://rezista.in/wp-content/uploads/2017/08/Rezista-Track-pants.png",
    },
    {
      "name": "HOODIES",
      "img":
          "https://w7.pngwing.com/pngs/146/40/png-transparent-hoodie-t-shirt-scotty-sire-hoodie-hat-hoodie-black.png",
    },
    {
      "name": "SHORTS",
      "img": "https://pbs.twimg.com/media/Ed6qIqZXoAEIQjF.png",
    },
    {
      "name": "JACKET",
      "img":
          "https://w7.pngwing.com/pngs/191/40/png-transparent-clothing-jacket-outerwear-coat-jacket-winter-orange-fictional-character-thumbnail.png",
    },
    {
      "name": "ACCESSORIES",
      "img":
          "https://png.pngtree.com/png-vector/20220702/ourmid/pngtree-patch-of-fashion-accessories-png-image_5549693.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(children: [
          for (var category in categories)
            _buildItemRow(category['img'], category['name']),
          SizedBox(height: 20),
        ]),
      ),
    );
  }

  Widget _buildItemRow(String img, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8),
      child: Container(
        height: 147.5,
        color: Color(0xFFf5f5f5),
        padding: EdgeInsets.symmetric(vertical: 25),
        child: Row(
          children: [
            Expanded(child: Image.network(img)),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 8),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductScreen()));
                  },
                  child: Text(
                    "Shop Now",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
