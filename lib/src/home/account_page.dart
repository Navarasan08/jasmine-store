import 'package:flutter/material.dart';
import 'package:jasmine_app/src/auth/login_screen.dart';
import 'package:jasmine_app/widget/custom_button.dart';
import 'package:jasmine_app/widget/custom_footer.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({super.key});

  @override
  State<MyAccountPage> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
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
                        child: Icon(Icons.account_circle),
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
            // rowItem("Notifications"),
            rowItem("Terms & Conditions"),
            rowItem("Return & Refund Policy"),
            rowItem("We Respect Your Privacy"),
            rowItem("Join Our Team"),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("Version 0.1"),
            ),

            SizedBox(height: 20),

            CustomFooter(),
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