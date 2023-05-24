import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KeyboardManager {
  static void init(BuildContext context, OverlayState overlay) {
    final entry = OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: () {
          SystemChannels.textInput.invokeMethod('TextInput.hide');
        },
        behavior: HitTestBehavior.translucent,
        child: Container(
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
    overlay.insert(entry);
  }
}
