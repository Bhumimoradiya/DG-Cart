import 'dart:async';
import 'dart:developer';
import 'package:digi_cart_furniture/component/widget.dart';
import 'package:digi_cart_furniture/screens/Authentication/Login/login.dart';
import 'package:digi_cart_furniture/screens/Authentication/registerAccount.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../component/appcolors.dart';

class EmailVerified extends StatefulWidget {
  const EmailVerified({super.key});

  @override
  State<EmailVerified> createState() => _EmailVerifiedState();
}

class _EmailVerifiedState extends State<EmailVerified> {
  bool isEmailverified = false;
  bool canResendEmail = false;

  Timer? timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isEmailverified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isEmailverified) {
      senderVerificationEmail();
      timer = Timer.periodic(Duration(seconds: 3), (timer) {
        checkEmailVerified();
      });
    }
  }

  Future senderVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      await user?.sendEmailVerification();
      setState(() {
        canResendEmail = false;
      });
      await Future.delayed(Duration(seconds: 5));
      setState(() {
        canResendEmail = true;
      });
    } catch (e) {
      // errorSnackbar(context, e.toString());
      log(e.toString());
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser?.reload();
    setState(() {
      isEmailverified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isEmailverified) {
      timer?.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return isEmailverified
        ? registerAccount()
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              // elevation: 0,
              centerTitle: true,
              title: Text(
                "Verified",
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              shadowColor: Colors.transparent,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 22,
                  )),
              backgroundColor: Appcolors.primarycolor,
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "A Verification Email has been sent to your email.",
                  style: TextStyle(
                    color: Appcolors.primarycolor,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 35,
                ),
                // Row(
                //   children: [
                //     ElevatedButton.icon(
                //         style: ElevatedButton.styleFrom(
                //           shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(25)),
                //           primary: Appcolors.primarycolor,
                //           // minimumSize: Size(150, 55)),
                //         ),
                // onPressed: senderVerificationEmail(),
                // icon: Icon(Icons.mail),
                // label: Text(
                //   "Resend Email",
                //   style: TextStyle(color: Colors.white, fontSize: 20),
                // )),
                //     ElevatedButton.icon(
                //         style: ElevatedButton.styleFrom(
                //           shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(25)),
                //           primary: Appcolors.primarycolor,
                //           // minimumSize: Size(150, 55)),
                //         ),
                //         onPressed: senderVerificationEmail(),
                //         icon: Icon(Icons.mail),
                //         label: Text(
                //           "Resend Email",
                //           style: TextStyle(color: Colors.white, fontSize: 20),
                //         )),
                //   ],
                // )
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              shadowColor: Colors.transparent, backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  side: BorderSide(
                                      width: 1, color: Appcolors.primarycolor)),
                              minimumSize: Size(150, 54)),
                          icon: Icon(
                            Icons.mail,
                            color: Appcolors.primarycolor,
                          ),
                          label: Text(
                            "Resend Email",
                            style: TextStyle(
                                color: Appcolors.primarycolor, fontSize: 18),
                          ),
                          onPressed:
                              canResendEmail ? senderVerificationEmail : null),
                      SizedBox(
                        width: 8,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shadowColor: Colors.transparent, backgroundColor: Appcolors.primarycolor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              minimumSize: Size(150, 54)),
                          onPressed: () {
                            nextscreen(context, login());
                          },
                          child: Text(
                            "Cancel",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
