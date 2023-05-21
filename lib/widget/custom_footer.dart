
import 'package:flutter/material.dart';

class CustomFooter extends StatelessWidget {
  const CustomFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Image.asset(
                    "assets/logo/Jasmine.png",
                    height: 30,
                  ),
                  SizedBox(height: 20),
                  _textWithIcon(Icons.navigation, "Tirutani"),
                  _textWithIcon(Icons.phone, "+91 904234232"),
                  _textWithIcon(Icons.mail, "contact@jasmine.com"),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("USEFUL LINKS",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
                  SizedBox(height: 20),
                  Text("Size Guide"),
                  Text("Shopping Policy"),
                  Text("Returns & Exchanges"),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("COMPANY",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
                  SizedBox(height: 20),
                  Text("Terms & Conditions"),
                  Text("Privacy Policy"),
                  Text("Contact us"),
                ],
              ),
            ),
          ],
        ),
        Divider(),
        Center(
          child: Text("Copyright © 2023 Jasmine Store. All rights reserved."),
        )
      ]),
    );
  }

  Widget _textWithIcon(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 5),
        Text(text),
      ],
    );
  }
}