import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:jasmine_app/src/auth/login_screen.dart';
import 'package:jasmine_app/src/auth/verify_account_screen.dart';
import 'package:jasmine_app/util/common_util.dart';
import 'package:jasmine_app/util/validator.dart';
import 'package:jasmine_app/widget/custom_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _passwordC = TextEditingController();
  final _confirmPasswordC = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  int? obscureIndex;

  void updateObscure(int? index) {
    setState(() {
      obscureIndex = index;
    });
  }

  void resetPasswordPressed() {
    if (_formKey.currentState!.validate()) {
      CommonUtils.showSuccessDialog(context,
          content: "Your Password Resets Successfully",
          showCancel: false,
           onTap: () {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (route) => false);
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _passwordC.dispose();
    _confirmPasswordC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // KeyboardManager.init(context);

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(13.0),
        child: Form(
          key: _formKey,
          child: Column(children: [
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "RESET YOUR PASSWORD",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _passwordC,
              obscureText: obscureIndex != 0,
              validator: Validators.password,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(obscureIndex == 0
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined),
                  onPressed: () => updateObscure(obscureIndex == 0 ? null : 0),
                ),
                hintText: "New Password",
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _confirmPasswordC,
              obscureText: obscureIndex != 1,
              validator: Validators.password,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                  icon: Icon(obscureIndex == 1
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined),
                  onPressed: () => updateObscure(obscureIndex == 1 ? null : 1),
                ),
                hintText: "Confirm New Password",
              ),
            ),
            SizedBox(height: 30),
            CustomSubmitButton(
              title: "Submit",
              onPressed: resetPasswordPressed,
            ),
          ]),
        ),
      ),
    );
  }
}
