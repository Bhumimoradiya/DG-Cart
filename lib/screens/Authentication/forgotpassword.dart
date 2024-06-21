import 'dart:developer';
import 'package:digi_cart_furniture/component/appcolors.dart';
import 'package:digi_cart_furniture/component/widget.dart';
import 'package:digi_cart_furniture/screens/Authentication/Login/login.dart';
import 'package:digi_cart_furniture/screens/Authentication/register.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _key = GlobalKey<FormState>();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController otpcontroller = TextEditingController();

  // void sendOTP() async {
  //   EmailAuth.sessionName = "Text session";
  //   var res = await EmailAuth.sendOtp(recipientMail: emailcontroller.text);
  // }

  // TextEditingController emailController = TextEditingController();
  // void forgetPassword(String email) async {
  //   try {
  //     final response = await http.post(
  //         Uri.parse('http://192.168.0.123/Digi_Furniture/forgetpasswordotp'),
  //         body: {'user_email': email});

  //     if (response.statusCode == 200) {
  //       var data = jsonDecode(response.body.toString());
  //       print(data);

  //       print('Email Added successfully');
  //       nextscreen(
  //           context,
  //           OtpScreen(
  //             page: newPassword,
  //           ));
  //     } else {
  //       print('failed');
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         behavior: SnackBarBehavior.floating,
  //         elevation: 2,
  //         duration: Duration(seconds: 1),
  //         padding: EdgeInsets.only(
  //           left: 20,
  //           right: 20,
  //         ),
  //         shape:
  //             RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  //         content: Container(
  //             height: 50,
  //             color: Colors.red,
  //             child: Padding(
  //               padding: EdgeInsets.only(top: 15, left: 10),
  //               child: Text(
  //                 'Invalid Email!!',
  //                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  //                 textAlign: TextAlign.start,
  //               ),
  //             )),
  //         backgroundColor: Colors.red,
  //       ));
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
  @override
  void dispose() {
    emailcontroller.dispose();
    // timer?.cancel();
    super.dispose();
  }

  Future resetPassword() async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Center(
                child: CircularProgressIndicator(
              color: Appcolors.primarycolor,
            )));
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailcontroller.text.trim());
      // successSnackbar(context, "Password Reset Email Sent.");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          // padding: EdgeInsets.only(top: 150),
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height - 100,
            left: 10,
            right: 10,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: Colors.green,
          elevation: 10,
          content: Row(
            children: [
              Icon(
                Icons.verified,
                color: Colors.white,
              ),
              SizedBox(width: 5),
              Text("Password Reset Email Sent."),
            ],
          )));
      Navigator.of(context).popUntil((route) {
        return nextscreen(context, login());
      });
      // setState(() {
      //   canResendPassword = false;
      // });
      // await Future.delayed(Duration(seconds: 5));
      // setState(() {
      //   canResendPassword = true;
      // });
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      Navigator.of(context).pop();
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return errorSnackbar(context, "No user found for that email.");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _key,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 30, left: 15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        // nextscreen(context, login());
                      },
                      child: Image(
                        image:
                            AssetImage("assets/images/Arrow_Left_Circle.png"),
                        height: height * 0.1,
                        width: width * 0.1,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: height * 0.28,
                  width: width,
                  decoration: BoxDecoration(
                      // color: Colors.black,
                      image: DecorationImage(
                    image: AssetImage(
                      "assets/images/_Layer_bgremove.png",
                    ),
                    fit: BoxFit.contain,
                    repeat: ImageRepeat.noRepeat,
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 30, left: 20, right: 20, bottom: 12),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Don't worry! it occurs. Please enter the email\naddress linked with your account.",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Email",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
                  child: TextFormField(
                    controller: emailcontroller,
                    style: TextStyle(
                        color: Colors.black,
                        // fontWeight: FontWeight.bold,
                        fontSize: 16),
                    cursorColor: Colors.grey,
                    keyboardType: TextInputType.emailAddress,
                    decoration: textInputDecorationgrey.copyWith(
                        hintText: "Enter your email",
                        prefixIcon: Icon(
                          Icons.mail_rounded,
                          color: Colors.grey,
                          size: 22,
                        )),
                  ),
                ),
                SizedBox(
                  height: height * 0.11,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)), backgroundColor: Appcolors.primarycolor,
                            minimumSize: Size(300, 55)),
                        onPressed:
                            resetPassword, // nextscreen(context, passwordVerified(email: emailcontroller.text.toString()));

                        // forgetPassword(emailController.text.toString());

                        child: Center(
                          child: Text(
                            "Send Link",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ))),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 25, right: 0),
                  child: Text.rich(TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: "Signup",
                          style: TextStyle(
                              fontSize: 14,
                              color: Appcolors.primarycolor,
                              fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              nextscreen(context, Register());
                            },
                        )
                      ])),
                )
              ],
            ),
          ),
        ));
  }
}
