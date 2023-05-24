import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:jasmine_app/src/auth/changed_password_screen.dart';
import 'package:jasmine_app/src/home/home_screen.dart';
import 'package:jasmine_app/util/validator.dart';
import 'package:jasmine_app/widget/custom_button.dart';
import 'package:pinput/pinput.dart';

enum VerifyAccountType { register, resetPassword }

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key, required this.accountType});

  final VerifyAccountType accountType;

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final _pinController = TextEditingController();
  final _focusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _pinController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void verifyPasswordPressed() {
    _focusNode.unfocus();
    if (_formKey.currentState!.validate()) {
      if (widget.accountType == VerifyAccountType.register) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => ChangePasswordScreen()));
      }

      // Navigator.popUntil(context, (route) => route.isFirst);
    }
  }

  @override
  Widget build(BuildContext context) {
    // KeyboardManager.init(context);
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: borderColor),
      ),
    );

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
                "VERIFY YOUR ACCOUNT",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
                "Enter the  6 Digit OTP code that has been sent to your Email ID nav*****@gmail.com"),
            SizedBox(height: 30),
            Pinput(
              length: 6,
              controller: _pinController,
              focusNode: _focusNode,
              androidSmsAutofillMethod:
                  AndroidSmsAutofillMethod.smsUserConsentApi,
              listenForMultipleSmsOnAndroid: true,
              defaultPinTheme: defaultPinTheme,
              validator: (String? val) => Validators.otp(val, limit: 6),
              onClipboardFound: (value) {
                debugPrint('onClipboardFound: $value');
                _pinController.setText(value);
              },
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              onCompleted: (pin) {
                debugPrint('onCompleted: $pin');
              },
              onChanged: (value) {
                debugPrint('onChanged: $value');
              },
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 9),
                    width: 22,
                    height: 1,
                    color: focusedBorderColor,
                  ),
                ],
              ),
              errorPinTheme: defaultPinTheme.copyBorderWith(
                border: Border.all(color: Colors.redAccent),
              ),
            ),
            SizedBox(height: 30),
            CustomSubmitButton(
              title: "Submit",
              onPressed: verifyPasswordPressed,
            ),
            SizedBox(height: 20),
            Text(
                "By clicking on the Submit a 6 digit OTP code will be sent to your Email ID"),
          ]),
        ),
      ),
    );
  }
}
