import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class UserServices {
  final FirebaseDatabase _database = FirebaseDatabase.instance;

  String ref = 'users';
  createUser(Map value) {
    _database
        .ref()
        .child(ref)
        .push()
        .set(value)
        .catchError((e) => {print(e.toString())});
  }
}
