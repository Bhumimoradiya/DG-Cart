import 'dart:async';
import 'package:digi_cart_furniture/component/widget.dart';
import 'package:digi_cart_furniture/screens/splashscreen/welcomeSplash.dart';
import 'package:flutter/material.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
      nextscreen(context, welcomeSplash());
    });
  }

  @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration(seconds: 4), () {
    //   nextscreen(context, welcomeSplash());
    // });
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Image(
            image: AssetImage(
              "assets/images/wing.png",
            ),
            height: 250,
          ))
        ],
      ),
    );
  }
}
