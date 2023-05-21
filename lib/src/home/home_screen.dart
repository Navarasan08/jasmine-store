import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        CustomAppBar(),
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: [
              LandingPage(),
              CustomFooter(),
            ],
          ),
        )),
      ]),
    );
  }
}

class LandingPage extends StatefulWidget {
  LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final List<String> imageUrls = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  PageController? _pageController;
  Timer? _timer;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPageIndex);

    // Start the timer for auto-scrolling
    // _timer = Timer.periodic(Duration(seconds: 4), (_) {
    //   if (_currentPageIndex < imageUrls.length - 1) {
    //     _currentPageIndex++;
    //   } else {
    //     _currentPageIndex = 0;
    //   }
    // });
  }

  @override
  void dispose() {
    _pageController?.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void navigate() {
    if (_pageController?.hasClients == true) {
      _currentPageIndex += 1;
    } else {
      _currentPageIndex = 0;
    }

     _pageController?.animateToPage(
        _currentPageIndex,
        duration: Duration(seconds: 2),
        curve: Curves.easeInOut,
      );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Builder(
      builder: (context) {
        return Container(
          height: size.height,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPageIndex = index;
              });
            },
            itemCount: imageUrls.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Image.network(
                    imageUrls[index],
                    fit: BoxFit.cover,
                    width: size.width,
                  ),
                  Positioned(
                      left: 20,
                      top: (size.height / 2) - 50,
                      child: IconButton(
                          onPressed: navigate,
                          icon: Icon(
                            Icons.navigate_before,
                            size: 45,
                          ))),
                  Positioned(
                      right: 20,
                      top: (size.height / 2) - 50,
                      child: IconButton(
                          onPressed: navigate,
                          icon: Icon(
                            Icons.navigate_next,
                            size: 45,
                          )))
                ],
              );
            },
          ),
        );
      },
    );
  }
}

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