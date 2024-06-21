import 'dart:async';

import 'package:digi_cart_furniture/component/widget.dart';
import 'package:digi_cart_furniture/screens/BottomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class registerAccount extends StatefulWidget {
  const registerAccount({super.key});

  @override
  State<registerAccount> createState() => _registerAccountState();
}

class _registerAccountState extends State<registerAccount> {
  var size, height, width;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4), () {
      nextscreen(context, bottomNavigationBar(myIndex: 0,));
    });
  }

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
                height: height * 0.2,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0, bottom: 15),
                child: Text(
                  "Thank you for Register!",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "Thank you for getting in touch! We\nappreciate you contacting us",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
