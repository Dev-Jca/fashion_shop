import 'package:fashion_shop/pages/app_view.dart';
import 'package:fashion_shop/pages/signup.dart';
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
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  late SharedPreferences preferences;
  bool isLoggedIn = false;
  bool hidePass = true;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    // isSignedIn();
  }

  void isSignedIn() async {
    setState(() {
      loading = true;
    });

    if (isLoggedIn == true) {
      Future.delayed(Duration.zero).then((_) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: ((context) => const AppView())));
      });

      setState(() {
        loading = false;
      });
    }
  }

  // Future handleSignIn() async {
  //   preferences = await SharedPreferences.getInstance();
  //   setState(() {
  //     loading = true;
  //   });

  // }

  void signOutGoogle() async {
    // await googleSignIn.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.1),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/background.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            alignment: Alignment.topCenter,
            child: Image.asset(
              'assets/images/logo.png',
              width: 350,
              height: 350,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 350.0),
            child: Container(
              alignment: Alignment.center,
              child: Center(
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      //===========================EMAIL INPUT=================================
                      Padding(
                        padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
                        child: Material(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(0.6),
                          elevation: 0,
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(26, 4.5, 14, 4.5),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Email',
                                icon: Icon(Icons.alternate_email_outlined),
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.emailAddress,
                              controller: _emailTextController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),
                      //===========================PASSWORD INPUT =================================
                      Padding(
                        padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
                        child: Material(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(0.6),
                          elevation: 0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: ListTile(
                              title: TextFormField(
                                decoration: const InputDecoration(
                                  hintText: 'Password',
                                  icon: Icon(Icons.lock_outline),
                                  border: InputBorder.none,
                                ),
                                controller: _passwordTextController,
                                obscureText: hidePass,
                                enableSuggestions: false,
                                autocorrect: false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'The password field cannot be empty';
                                  } else if (value.length < 6) {
                                    return 'The password has to be atleast 6 characters';
                                  }
                                  return null;
                                },
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  setState(() {
                                    hidePass = !hidePass;
                                  });
                                },
                                icon: Icon(
                                  hidePass
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //===========================LOGIN BUTTON=================================
                      Padding(
                        padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
                        child: Material(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black.withOpacity(0.8),
                          elevation: 0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: MaterialButton(
                              minWidth: MediaQuery.of(context).size.width,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Login',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // =================FORGOT PASSWORD========================================
                      const Divider(),
                      const Center(
                        child: Text(
                          'Forgot password?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      const Divider(),
                      //====================DONT HAVE ACCOUNT SIGN UP==============================
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 8, 30, 8),
                        child: Row(
                          children: [
                            const Text(
                              "Don't have an account? click here to",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const SignUp()));
                              },
                              child: const Text(
                                " " "Sign up",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
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
    );
  }
}
