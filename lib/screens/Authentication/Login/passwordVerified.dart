// import 'dart:async';
// import 'dart:developer';

// import 'package:digi_cart_furniture/component/appcolors.dart';
// import 'package:digi_cart_furniture/component/widget.dart';
// import 'package:digi_cart_furniture/screens/Authentication/password_change.dart';
// import 'package:digi_cart_furniture/screens/sliderscreen/slider_page.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// import 'login.dart';

// class passwordVerified extends StatefulWidget {
//   const passwordVerified({super.key, required this.email});
//   final email;
//   @override
//   State<passwordVerified> createState() => _passwordVerifiedState();
// }

// class _passwordVerifiedState extends State<passwordVerified> {
//   static final auth = FirebaseAuth.instance;
//   bool isPasswordverified = false;
//   bool canResendPassword = false;
//   static AuthStatus? _status;
//   var size, height, width;
//   Timer? timer;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();

//     // if (_status != AuthStatus.successful) {
//     //   resetPassword();
//     //   timer = Timer.periodic(Duration(seconds: 3), (timer) {
//     //     checkPasswordSend();
//     //   });
//     // }
//     // if (_status == AuthStatus.successful) {
//     //   timer?.cancel();
//     // }
//   }

//   @override
//   void dispose() {
//     widget.email.dispose();
//     // timer?.cancel();
//     super.dispose();
//   }

//   Future resetPassword() async {
//     showDialog(
//         barrierDismissible: false,
//         context: context,
//         builder: (context) => CircularProgressIndicator());
//     try {
//       await auth.sendPasswordResetEmail(email: widget.email);
//       successSnackbar(context, "Password Reset Email Sent.");
//       Navigator.of(context).popUntil((route) => route.isFirst);
//       // setState(() {
//       //   canResendPassword = false;
//       // });
//       // await Future.delayed(Duration(seconds: 5));
//       // setState(() {
//       //   canResendPassword = true;
//       // });
//     } on FirebaseAuthException catch (e) {
//       log(e.toString());
//       Navigator.of(context).pop();
//     }
//   }

//   // Future checkPasswordSend() async {
//   //   await FirebaseAuth.instance.currentUser?.reload();
//   //   if (_status == AuthStatus.successful) {
//   //     timer?.cancel();
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return isPasswordverified
//         ? passwordChange()
//         : Scaffold(
//             backgroundColor: Colors.white,
//             appBar: AppBar(
//               // elevation: 0,
//               centerTitle: true,
//               title: Text(
//                 "Reset Password",
//                 style: TextStyle(
//                   fontSize: 22,
//                 ),
//               ),
//               shadowColor: Colors.transparent,
//               leading: IconButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   icon: Icon(
//                     Icons.arrow_back_ios,
//                     size: 22,
//                   )),
//               backgroundColor: Appcolors.primarycolor,
//             ),
//             body: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   "A Forgot Password Link has been sent to your email.",
//                   style: TextStyle(
//                     color: Appcolors.primarycolor,
//                     fontSize: 20,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(
//                   height: 35,
//                 ),
//                 // Row(
//                 //   children: [
//                 //     ElevatedButton.icon(
//                 //         style: ElevatedButton.styleFrom(
//                 //           shape: RoundedRectangleBorder(
//                 //               borderRadius: BorderRadius.circular(25)),
//                 //           primary: Appcolors.primarycolor,
//                 //           // minimumSize: Size(150, 55)),
//                 //         ),
//                 // onPressed: senderVerificationEmail(),
//                 // icon: Icon(Icons.mail),
//                 // label: Text(
//                 //   "Resend Email",
//                 //   style: TextStyle(color: Colors.white, fontSize: 20),
//                 // )),
//                 //     ElevatedButton.icon(
//                 //         style: ElevatedButton.styleFrom(
//                 //           shape: RoundedRectangleBorder(
//                 //               borderRadius: BorderRadius.circular(25)),
//                 //           primary: Appcolors.primarycolor,
//                 //           // minimumSize: Size(150, 55)),
//                 //         ),
//                 //         onPressed: senderVerificationEmail(),
//                 //         icon: Icon(Icons.mail),
//                 //         label: Text(
//                 //           "Resend Email",
//                 //           style: TextStyle(color: Colors.white, fontSize: 20),
//                 //         )),
//                 //   ],
//                 // )
//                 Padding(
//                   padding: const EdgeInsets.only(left: 5, right: 5),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       ElevatedButton.icon(
//                           style: ElevatedButton.styleFrom(
//                               shadowColor: Colors.transparent,
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(25),
//                                   side: BorderSide(
//                                       width: 1, color: Appcolors.primarycolor)),
//                               primary: Colors.white,
//                               minimumSize: Size(160, 54)),
//                           icon: Icon(
//                             Icons.mail,
//                             color: Appcolors.primarycolor,
//                           ),
//                           label: Text(
//                             "Resend Link",
//                             style: TextStyle(
//                                 color: Appcolors.primarycolor, fontSize: 18),
//                           ),
//                           onPressed: canResendPassword ? resetPassword : null),
//                       SizedBox(
//                         width: 8,
//                       ),
//                       ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               shadowColor: Colors.transparent,
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(25)),
//                               primary: Appcolors.primarycolor,
//                               minimumSize: Size(160, 54)),
//                           onPressed: () {
//                             nextscreen(context, login());
//                           },
//                           child: Text(
//                             "Cancel",
//                             style: TextStyle(color: Colors.white, fontSize: 20),
//                           )),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//   }
// }
