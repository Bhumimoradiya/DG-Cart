import 'package:digi_cart_furniture/component/widget.dart';
import 'package:digi_cart_furniture/screens/Authentication/Login/login.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class passwordChange extends StatefulWidget {
  const passwordChange({super.key});

  @override
  State<passwordChange> createState() => _passwordChangeState();
}

class _passwordChangeState extends State<passwordChange> {
  var size, height, width;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: height * 0.25,
            left: width * 0.12,
            child: Center(
                child: Lottie.asset("assets/images/verified.json",
                    repeat: true, height: height * 0.35)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.3,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0, bottom: 15),
                child: Text(
                  "Password Changed!",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "Your password has been changed\nsuccessfully.",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                child: elevatedButton(context, "Back to Login", login()),
              )
            ],
          ),
        ],
      ),
    );
  }
}
