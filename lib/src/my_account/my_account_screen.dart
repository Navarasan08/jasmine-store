import 'package:flutter/material.dart';
import 'package:jasmine_app/src/auth/login_screen.dart';
import 'package:jasmine_app/widget/custom_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({super.key});

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Account"),
        elevation: 5.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Color(0xffE3E8F0),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 37,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        radius: 35,
                        child: Icon(MdiIcons.accountCircle),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                        child: CustomSubmitButton(
                      title: "Sign In / Join",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                    )),
                  ],
                ),
              ),
            ),
            rowItem("Customer Care"),
            rowItem("Invite Friends & Earn"),
            rowItem("Notifications"),
            rowItem("Terms & Conditions"),
            rowItem("Return & Refund Policy"),
            rowItem("We Respect Your Privacy"),
            rowItem("Join Our Team"),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("Version 0.1"),
            ),
          ],
        ),
      ),
    );
  }

  Widget rowItem(String title) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(title),
                ),
                Icon(Icons.navigate_next),
              ],
            ),
          ),
        ),
        Divider(),
      ],
    );
  }
}
