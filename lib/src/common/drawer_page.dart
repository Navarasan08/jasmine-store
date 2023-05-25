import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Navarasan"),
            accountEmail: Text("navarasan@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                "N",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                 SizedBox(
                  height: 20,
                ),
                Text(
                  "Shop By Categories".toUpperCase(),
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20,
                ),
                _buildRow("Shirts"),
                _buildRow("Pants"),
                _buildRow("Hoodies"),
                _buildRow("Sarees"),
                _buildRow("Shorts"),
                _buildRow("Accessories"),
              ],
            ),
          )),

          Text("v1.0"),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildRow(String name) {
    return Column(
      children: [
        ListTile(
          title: Text(name),
          trailing: Icon(Icons.navigate_next),
        ),
        Divider(),
      ],
    );
  }
}
