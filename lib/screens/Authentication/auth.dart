import 'package:digi_cart_furniture/screens/Authentication/emailVerified.dart';
import 'package:digi_cart_furniture/screens/splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return EmailVerified();
        } else {
          return splashScreen();
        }
      },
      stream: null,
    );
  }
}
