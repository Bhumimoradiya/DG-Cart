import 'dart:async';

import 'package:digi_cart_furniture/component/widget.dart';
import 'package:flutter/material.dart';

import '../sliderscreen/sliderscreen.dart';

class welcomeSplash extends StatefulWidget {
  const welcomeSplash({super.key});

  @override
  State<welcomeSplash> createState() => _welcomeSplashState();
}

class _welcomeSplashState extends State<welcomeSplash> {
  var size, height, width;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
      nextscreen(context, sliderscreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration(seconds: 4), () {
    //   nextscreen(context, sliderScreen());
    // });
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/armchair.png",
                ),
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.72), BlendMode.dstATop),
                fit: BoxFit.cover,
                repeat: ImageRepeat.noRepeat,
                opacity: 100)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 0, bottom: 40, left: 20, right: 20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Welcome to 👋",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Furniture",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 60,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "The best e-commerce app of the century\nfor your daily needs!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
