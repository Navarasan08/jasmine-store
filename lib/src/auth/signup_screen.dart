import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jasmine_app/src/auth/verify_account_screen.dart';
import 'package:jasmine_app/util/validator.dart';
import 'package:jasmine_app/widget/custom_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailC = TextEditingController();
  final _name = TextEditingController();
  final _passwordC = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  void setLoading(bool val) {
    setState(() {
      isLoading = val;
    });
  }

  void register() async {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => VerifyOtpScreen(
                    accountType: VerifyAccountType.register,
                  )));
    }
  }

  @override
  void dispose() {
    super.dispose();
    _emailC.dispose();
    _passwordC.dispose();
    _name.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(13.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "CREATE AN ACCOUNT",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _name,
                validator: (value) =>
                    Validators.requiredValidation(value!, "Full Name"),
                decoration: InputDecoration(hintText: "Full Name"),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _emailC,
                validator: (value) => Validators.email(value!, "Email"),
                decoration: InputDecoration(hintText: "Email Id"),
              ),
              SizedBox(height: 10),
              TextFormField(
                obscureText: true,
                controller: _passwordC,
                validator: (value) => Validators.email(value!, "Password"),
                decoration: InputDecoration(hintText: "Password"),
              ),
              SizedBox(height: 40),
              if (isLoading)
                Center(
                  child: CircularProgressIndicator(),
                )
              else
                CustomSubmitButton(title: "Register", onPressed: register),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Existing User?"),
                    SizedBox(width: 5),
                    Text(
                      "Login",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).primaryColor),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
