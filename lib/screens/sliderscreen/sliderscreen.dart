import 'dart:async';

import 'package:digi_cart_furniture/component/widget.dart';
import 'package:digi_cart_furniture/screens/sliderscreen/slide.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

import '../../component/appcolors.dart';
import '../Authentication/Login/login.dart';
import 'slider_page.dart';

class sliderscreen extends StatefulWidget {
  @override
  State<sliderscreen> createState() => _sliderscreenState();
}

class _sliderscreenState extends State<sliderscreen> {
  // const Onboarding_screen({super.key});
  int currentPage = 0;

  var size, height, width;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    final page = [
      slider_page(
        currentindex: currentPage,
        model: slide(
            imageurl: page1_imageurl,
            title: page1_title,
            title2: page1_title2,
            title3: page1_title3,
            color: page1_color),
      ),
      slider_page(
        currentindex: currentPage,
        model: slide(
            imageurl: page2_imageurl,
            title: page2_title,
            title2: page2_title2,
            title3: page2_title3,
            color: page1_color),
      ),
      slider_page(
          currentindex: currentPage,
          model: slide(
              imageurl: page3_imageurl,
              title: page3_title,
              title2: page3_title2,
              title3: page3_title3,
              color: page1_color))
    ];
    return Scaffold(
        body: Stack(
      children: [
        LiquidSwipe(
          waveType: WaveType.liquidReveal,
          onPageChangeCallback: onPageChangeCallback,
          pages: page,
          enableLoop: false,
          liquidController: controller,
        ),
        Positioned(
          top: height / 1.38,
          left: width * 0.2,
          right: width * 0.2,
          child: Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Appcolors.primarycolor,
                      minimumSize: Size(210, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(22)))),
                  onPressed: () {
                    // if (currentindex == 0 || currentindex == 1) {
                    //   _controller.nextPage(
                    //       duration: Duration(microseconds: 100),
                    //       curve: Curves.bounceIn);
                    // }

                    int nextpage = controller.currentPage + 1;
                    controller.jumpToPage(page: nextpage);
                    if (currentPage == 2 || currentPage == 3) {
                      Timer(Duration(seconds: 2), () {
                        nextscreen(context, login());
                      });
                    }
                  },
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ))),
        ),
      ],
    ));
  }

  onPageChangeCallback(int activeindex) {
    setState(() {
      currentPage = activeindex;
    });
  }
}
