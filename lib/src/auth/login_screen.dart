import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:jasmine_app/src/auth/forgot_password_screen.dart';
import 'package:jasmine_app/src/auth/signup_screen.dart';
import 'package:jasmine_app/src/home/home_screen.dart';
import 'package:jasmine_app/util/validator.dart';
import 'package:jasmine_app/widget/custom_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordVisibile = false;

  final _emailC = TextEditingController();
  final _passwordC = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  void changePasswordVisibility() {
    setState(() {
      isPasswordVisibile = !isPasswordVisibile;
    });
  }

  void loginPressed() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }

  @override
  void dispose() {
    super.dispose();
    _emailC.dispose();
    _passwordC.dispose();
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
                "SIGN IN",
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
            SizedBox(height: 10),
            TextFormField(
              obscureText: isPasswordVisibile,
              controller: _passwordC,
              validator: Validators.password,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                  icon: Icon(isPasswordVisibile
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined),
                  onPressed: changePasswordVisibility,
                ),
                hintText: "Password",
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ForgotPasswordScreen()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Forgot your Password"),
                  SizedBox(width: 5),
                  Icon(MdiIcons.arrowRight),
                ],
              ),
            ),
            SizedBox(height: 20),
            CustomSubmitButton(
              title: "Sign In",
              onPressed: loginPressed,
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("New User?"),
                  SizedBox(width: 5),
                  Text(
                    "SignUp",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColor),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
