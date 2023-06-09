
import 'package:flutter/material.dart';
import 'package:jasmine_app/src/product/product_detail_screen.dart';
import 'package:jasmine_app/src/shop_widgets/product_card.dart';
import 'package:jasmine_app/src/shop_widgets/product_carousel.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  List<Map> infoDetails = [
    {
      "icon": Icons.car_repair_outlined,
      "title": "Fast Shipping",
      "subtitle": "Fast shipping",
    },
    {
      "icon": Icons.price_check_rounded,
      "title": "Cash On Delivery",
      "subtitle": "COD available",
    },
    {
      "icon": Icons.headphones,
      "title": "ONLINE SUPPORT 24/7",
      "subtitle": "Awesome Support for 24/7 Days",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(children: [
           ProductCarousel(
            carouselType: CarouselType.offer,
          ),
          SizedBox(height: 30),
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: <Widget>[
              Expanded(child: Divider()),
              SizedBox(width: 5),
              Text(
                "NEW ARRAIVALS",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(width: 5),
              Expanded(child: Divider()),
            ]),
          ),
          _buildItems(),
          SizedBox(height: 15),
          for (var info in infoDetails)
            _buildInfoCard(info['icon'], info['title'], info['subtitle']),
          SizedBox(height: 30),
        ]),
      ),
    );
  }

  Widget _buildItems() {
    return GridView.builder(
        itemCount: 5,
        padding: EdgeInsets.all(8),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
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
              rating: 5.0,
              oldPrice: 2499,
              offPercent: 81);
        });
  }


  Widget _buildInfoCard(IconData icon, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffdee2e6)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30),
            SizedBox(width: 15),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
