import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CommonUtils {
  static Widget logo({double? height}) {
    return Image.asset(
      "assets/logo/Jasmine.png",
      height: height ?? 30,
    );
  }

  static void showSuccessDialog(BuildContext context,
      {required String content, VoidCallback? onTap, bool showCancel = true}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              content: Column(mainAxisSize: MainAxisSize.min, children: [

                SizedBox(height: 20),
                Center(
                  child: Icon(
                    MdiIcons.checkCircleOutline,
                    color: Colors.green,
                    size: 36,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Success",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 20),
                Text(content),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if(showCancel)
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Cancel")),
                    SizedBox(width: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)
                        )
                      ),
                        onPressed: () {
                          onTap?.call();
                        },
                        child: Text("Ok")),
                  ],
                )
              ]),
            ));
  }

  static void showFailureDialog(BuildContext context) {}

  static void showToast(BuildContext context) {}
}
