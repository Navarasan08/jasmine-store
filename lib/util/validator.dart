import 'package:flutter/material.dart';

class Validators {
  static String? requiredValidation(String? value, [String? name]) {
    if (value != null) {
      return value.isEmpty ? "${name ?? 'Field'} is Required*" : null;
    } else {
      return "$name is Required*";
    }
  }

  static String? email(String? value, [String? name]) {
    return value!.isEmpty ? "${name ?? 'Email Id'} is Required*" : null;
  }

  static String? password(String? value, [String? name]) {
    return value!.isEmpty ? "${name ?? 'Password'} is Required*" : null;
  }

  static String? otp(String? value, {String? name, int? limit}) {
    return value!.isEmpty ? "${name ?? 'Password'} is Required*" : null;
  }
}
