
import 'package:flutter/material.dart';

class CustomFooter extends StatelessWidget {
   CustomFooter({super.key});

  List<String> copyrightImg = [
    "http://hunterclothing.in/assets/images/icons/visa.png",
    "http://hunterclothing.in/assets/images/icons/paypal.png",
    "http://hunterclothing.in/assets/images/icons/mastercard.png",
    "http://hunterclothing.in/assets/images/icons/american-express.png"
  ];

  @override
  Widget build(BuildContext context) {
   
    return Container(
      child: Column(
        children: [
          Text("Copyright © ${DateTime.now().year}. All right reserved."),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var img in copyrightImg) _buildCopyright(img),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCopyright(String img) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        color: Color(0xfff1f1f1),
        padding: EdgeInsets.all(10),
        child: Image.network(
          img,
          height: 18,
        ),
      ),
    );
  }
}