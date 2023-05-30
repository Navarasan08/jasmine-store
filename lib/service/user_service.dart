import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/login_user.dart';

class UserService {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

    // POST
  static Future<void> addUser(LoginUser user) async {
    CollectionReference userCollection = firestore.collection('users');

    try {
      await userCollection.add(user.toJson());
      return;
    } catch (e) {
      throw "$e";
    }
  }

  
}