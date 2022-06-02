import 'package:fashion_shop/pages/login.dart';
import 'package:fashion_shop/pages/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      theme: ThemeData(primaryColor: Colors.lightGreen),
      debugShowCheckedModeBanner: false,
      home: const Login(),
    ),
  );
}
