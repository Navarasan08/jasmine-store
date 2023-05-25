import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:jasmine_app/src/auth/signup_screen.dart';
import 'package:jasmine_app/src/auth/verify_account_screen.dart';
import 'package:jasmine_app/util/validator.dart';
import 'package:jasmine_app/widget/custom_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailC = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  void resetPasswordPressed() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => VerifyOtpScreen(accountType: VerifyAccountType.resetPassword,)));
    }
  }

  @override
  void dispose() {
    super.dispose();
    _emailC.dispose();
    _formKey.currentState?.dispose();
    log("Disposed");
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
              controller: _emailC,
              validator: Validators.email,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                hintText: "Email",
              ),
            ),
            SizedBox(height: 30),
            CustomSubmitButton(
              title: "Submit",
              onPressed: resetPasswordPressed,
            ),
            SizedBox(height: 20),
            Text(
                "By clicking on the Submit a 6 digit OTP code will be sent to your Email ID")
          ]),
        ),
      ),
    );
  }
}
