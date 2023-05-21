import 'package:flutter/material.dart';

class CommonUtils {
  static Widget logo({double? height}) {
    return Image.asset("assets/logo/Jasmine.png", height: height ?? 30,);
  }
}
