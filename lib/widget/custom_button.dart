
import 'package:flutter/material.dart';
import 'package:jasmine_app/widget/responsive.dart';

class CustomSubmitButton extends StatelessWidget {
  const CustomSubmitButton(
      {super.key, required this.title, this.onPressed, this.color});

  final String title;
  final VoidCallback? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))
        ),
        backgroundColor: color ?? Theme.of(context).primaryColor,
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: ResponsiveWidget.isLargeScreen(context) ? 18 : 0)
      ),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ));
  }
}
