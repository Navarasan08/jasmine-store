
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            "assets/logo/Jasmine.png",
            height: 30,
          ),
          Row(
            children: [
              Text("New Collections"),
              SizedBox(width: 15),
              Text("Mens Clothings"),
              SizedBox(width: 15),
              Text("Contact us"),
              SizedBox(width: 15),
              TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.shopping_bag_outlined),
                  label: Text("Cart")),
              SizedBox(width: 15),
            ],
          )
        ],
      ),
    );
  }
}
