// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import '../firebase_options.dart';

// class RegisterView extends StatefulWidget {
//   const RegisterView({Key? key}) : super(key: key);

//   @override
//   State<RegisterView> createState() => _RegisterViewState();
// }

// class _RegisterViewState extends State<RegisterView> {
//   late final TextEditingController _email;
//   late final TextEditingController _password;

//   @override
//   void initState() {
//     _email = TextEditingController();
//     _password = TextEditingController();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _email.dispose();
//     _password.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0.1,
//         backgroundColor: Colors.lightGreen,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(
//             Icons.arrow_back,
//           ),
//         ),
//         title: const Padding(
//           padding: EdgeInsets.fromLTRB(85, 0, 0, 0),
//           child: Text('Register'),
//         ),
//       ),
//       body: Column(
//         children: [
//           TextField(
//             controller: _email,
//             obscureText: false,
//             autocorrect: false,
//             enableSuggestions: false,
//             keyboardType: TextInputType.emailAddress,
//             decoration: const InputDecoration(
//               hintText: 'Please enter your email here',
//             ),
//           ),
//           TextField(
//             controller: _password,
//             obscureText: true,
//             autocorrect: false,
//             enableSuggestions: false,
//             decoration: const InputDecoration(
//               hintText: 'Please enter your password here',
//             ),
//           ),
//           Row(
//             children: [
//               Expanded(
//                 child: MaterialButton(
//                   color: Colors.lightGreen,
//                   onPressed: () async {
//                     final email = _email.text;
//                     final password = _password.text;
//                     try {
//                       await FirebaseAuth.instance
//                           .createUserWithEmailAndPassword(
//                         email: email,
//                         password: password,
//                       );
//                       final user = FirebaseAuth.instance.currentUser;
//                       user?.sendEmailVerification();
//                       Navigator.of(context).pushNamedAndRemoveUntil(
//                         '/login/',
//                         (route) => false,
//                       );
//                     } on FirebaseAuthException catch (e) {
//                       if (e.code == 'weak-password') {
//                         print('weak password');
//                       } else if (e.code == 'email-already-in-use') {
//                         print('email already in use');
//                       } else if (e.code == 'invalid-email') {
//                         print('invalid email');
//                       }
//                     } catch (e) {
//                       print(e);
//                     }
//                   },
//                   child: const Text(
//                     'Register',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.of(context)
//                   .pushNamedAndRemoveUntil('/login/', (route) => false);
//             },
//             child: const Text(
//               'Already registered? Login here',
//               style: TextStyle(
//                 color: Colors.lightGreen,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
