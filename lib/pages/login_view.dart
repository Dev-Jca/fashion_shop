import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.lightGreen,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.fromLTRB(85, 0, 0, 0),
          child: Text('Login'),
        ),
      ),
      body: Column(
        children: [
          TextField(
            controller: _email,
            obscureText: false,
            autocorrect: false,
            enableSuggestions: false,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: 'Please enter your email here',
            ),
          ),
          TextField(
            controller: _password,
            obscureText: true,
            autocorrect: false,
            enableSuggestions: false,
            decoration: const InputDecoration(
              hintText: 'Please enter your password here',
            ),
          ),
          Row(
            children: [
              Expanded(
                child: MaterialButton(
                  color: Colors.lightGreen,
                  onPressed: () async {
                    final email = _email.text;
                    final password = _password.text;
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: email,
                        password: password,
                      );

                      final user = FirebaseAuth.instance.currentUser;
                      if (user?.emailVerified ?? false) {
                        Navigator.of(context)
                            .pushNamedAndRemoveUntil('/app/', (route) => false);
                      } else {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/verifyEmail/', (route) => false);
                      }
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        print('user not found');
                      } else if (e.code == 'weak-password') {
                        print('weak password');
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/register/', (route) => false);
            },
            child: const Text(
              'Not registered yet? Register here',
              style: TextStyle(
                color: Colors.lightGreen,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
