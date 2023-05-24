import 'package:flutter/material.dart';
import 'package:jasmine_app/util/common_util.dart';

class OfferScreen extends StatefulWidget {
  const OfferScreen({super.key});

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonUtils.logo(height: 20),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.shopping_bag_outlined)),
                  ],
                ),
              ),
              SizedBox(height: 20),

              _offerCard(50),
              _offerCard(30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _offerCard(int percent) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: 130,
        child: Card(
          child: Center(
            child: Text("$percent %"),
          ),
        ),
      ),
    );
  }
}
