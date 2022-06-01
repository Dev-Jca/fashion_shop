import 'package:fashion_shop/pages/app_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  late SharedPreferences preferences;
  bool isLoggedIn = false;
  bool loading = false;
  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async {
    setState(() {
      loading = true;
    });

    preferences = await SharedPreferences.getInstance();
    isLoggedIn = await googleSignIn.isSignedIn();
    if (isLoggedIn == true) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: ((context) => const AppView())));

      setState(() {
        loading = false;
      });
    }
  }

  Future handleSignIn() async {
    preferences = await SharedPreferences.getInstance();
    setState(() {
      loading = true;
    });
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    final GoogleSignInAuthentication? googleSignInAuthentication =
        await googleSignInAccount?.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication?.accessToken,
      idToken: googleSignInAuthentication?.idToken,
    );
    final UserCredential userCredential =
        await _auth.signInWithCredential(credential);
    final User? user = userCredential.user;
    assert(!user!.isAnonymous);
    assert(await user?.getIdToken() != null);
    final User? currentUser = _auth.currentUser;
    assert(user!.uid == currentUser!.uid);

    if (user != null) {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("users")
          .where("id", isEqualTo: user.uid)
          .get();
      List<DocumentSnapshot> documents = querySnapshot.docs;
      if (documents.isEmpty) {
        FirebaseFirestore.instance.collection("users").doc(user.uid).set({
          "id": user.displayName,
          "userName": user.displayName,
          "profilePicture": user.photoURL,
        });
        await preferences.setString("id", user.uid);
        await preferences.setString("userName", user.displayName ?? 'default');
        await preferences.setString("photoURl", user.photoURL ?? 'default');
      } else {
        await preferences.setString("id", documents[0]["id"]);
        await preferences.setString("userName", documents[0]["userName"]);
        await preferences.setString("photoURL", documents[0]["photoURL"]);
      }
      Fluttertoast.showToast(msg: 'Login was successful');
      setState(() {
        loading = false;
      });
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: ((context) => const AppView())));
    } else {
      Fluttertoast.showToast(msg: 'Login failed:(');
    }
  }

  void signOutGoogle() async {
    await googleSignIn.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.1,
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.green),
        ),
      ),
      body: Stack(
        children: [
          Visibility(
            visible: loading,
            child: Center(
              child: Container(
                alignment: Alignment.center,
                color: Colors.white.withOpacity(0.9),
                child: const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 12.0,
            right: 12.0,
            top: 8.0,
            bottom: 8.0,
          ),
          child: ElevatedButton.icon(
            icon: const FaIcon(
              FontAwesomeIcons.google,
              color: Colors.red,
            ),
            style: TextButton.styleFrom(
              backgroundColor: Colors.lightGreen,
            ),
            onPressed: () {
              handleSignIn();
            },
            label: const Text(
              'SignIn/SignUp with Google',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
