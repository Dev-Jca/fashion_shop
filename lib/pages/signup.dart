import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_shop/firebase_options.dart';
import 'package:fashion_shop/main.dart';
import 'package:fashion_shop/pages/app_view.dart';
import 'package:fashion_shop/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fashion_shop/db/users.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  UserServices _userServices = UserServices();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _confirmPasswordTextController =
      TextEditingController();
  final TextEditingController _nameTextController = TextEditingController();
  String? gender;
  String groupValue = 'male';
  bool hidePass = true;
  bool loading = false;

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
                      //===========================NAME INPUT =================================
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
                                hintText: 'Full Name',
                                icon: Icon(Icons.person_outline),
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.emailAddress,
                              controller: _nameTextController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'The name field cannot be empty';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),
//=========================GENDER SELECTION============================================
                      // Row(
                      //   children: [
                      //     Expanded(
                      //       child: ListTile(
                      //         title: Radio(
                      //           fillColor: MaterialStateColor.resolveWith(
                      //             (states) => Colors.white.withOpacity(0.7),
                      //           ),
                      //           value: 'male',
                      //           groupValue: groupValue,
                      //           onChanged: (e) => valueChanged(e),
                      //         ),
                      //         trailing: Padding(
                      //           padding: const EdgeInsets.only(right: 45.0),
                      //           child: Text(
                      //             'male',
                      //             textAlign: TextAlign.end,
                      //             style: TextStyle(
                      //                 color: Colors.white.withOpacity(0.7)),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     Expanded(
                      //       child: ListTile(
                      //         title: Radio(
                      //           fillColor: MaterialStateColor.resolveWith(
                      //             (states) => Colors.white.withOpacity(0.7),
                      //           ),
                      //           value: 'female',
                      //           groupValue: groupValue,
                      //           onChanged: (e) => valueChanged(e),
                      //         ),
                      //         trailing: Padding(
                      //           padding: const EdgeInsets.only(right: 45.0),
                      //           child: Text(
                      //             'female',
                      //             textAlign: TextAlign.end,
                      //             style: TextStyle(
                      //                 color: Colors.white.withOpacity(0.7)),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
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
                      //===========================CONFIRMPASSWORD INPUT =================================
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
                                  hintText: 'Confirm password',
                                  icon: Icon(Icons.lock_outline),
                                  border: InputBorder.none,
                                ),
                                controller: _confirmPasswordTextController,
                                obscureText: hidePass,
                                enableSuggestions: false,
                                autocorrect: false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'The password field cannot be empty';
                                  } else if (value.length < 6) {
                                    return 'The password has to be atleast 6 characters';
                                  } else if (_passwordTextController.text !=
                                      value) {
                                    return 'the passwords do not match';
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

                      //===========================SIGNUP BUTTON=================================
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
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState?.reset();

                                  await _auth
                                      .createUserWithEmailAndPassword(
                                        email: _emailTextController.text,
                                        password: _passwordTextController.text,
                                      )
                                      .then((value) => {
                                            FirebaseFirestore.instance
                                                .collection('users')
                                                .doc(value.user?.uid)
                                                .set({
                                              "email": value.user?.email,
                                              "userName":
                                                  _nameTextController.text,
                                            })
                                          });
                                  User? user = _auth.currentUser;
                                  if (user != null) {
                                    Future.delayed(Duration.zero).then((_) => {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Login()))
                                        });
                                  }
                                }
                              },
                              child: const Text(
                                'Signup',
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

                      //====================DONT HAVE ACCOUNT SIGN UP==============================
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 8, 30, 8),
                        child: Row(
                          children: [
                            const Text(
                              "Have an account already? click here to",
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
                                        builder: (context) => const Login()));
                              },
                              child: const Text(
                                " " "Login",
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
          // Visibility(
          //   child: Center(
          //     child: Container(
          //       alignment: Alignment.center,
          //       color: Colors.white.withOpacity(0.9),
          //       child: const CircularProgressIndicator(
          //         valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  valueChanged(e) {
    setState(() {
      if (e == 'male') {
        groupValue = e;
        gender = e;
      } else if (e == 'female') {
        groupValue = e;
        gender = e;
      }
    });
  }
}
