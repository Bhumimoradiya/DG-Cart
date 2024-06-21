import 'package:digi_cart_furniture/component/appcolors.dart';
import 'package:digi_cart_furniture/component/widget.dart';
import 'package:digi_cart_furniture/screens/sliderscreen/thirdslider.dart';
import 'package:flutter/material.dart';

import '../Homepage/homepage.dart';

class secondSliderScreen extends StatefulWidget {
  const secondSliderScreen({super.key});

  @override
  State<secondSliderScreen> createState() => _secondSliderScreenState();
}

class _secondSliderScreenState extends State<secondSliderScreen> {
  var size, height, width;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(
        top: 30,
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: height * 0.73,
                width: width,
                decoration: BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/images/velvet-armchair.png",
                        ),
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                        repeat: ImageRepeat.noRepeat,
                        opacity: 70)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 550),
                child: Positioned(
                    // top: 30,
                    child: Container(
                  height: height * 0.26,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                            child: Text(
                          "Your Satisfaction Is",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        )),
                        Center(
                            child: Text(
                          "Our Number One",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        )),
                        Center(
                            child: Text(
                          "Priority",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 25, top: 30),
                                  child: Container(
                                    height: 6,
                                    width: 6,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade400,
                                        shape: BoxShape.circle),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, top: 30),
                                  child: Container(
                                    height: 6,
                                    width: 6,
                                    decoration: BoxDecoration(
                                        color: Appcolors.primarycolor,
                                        shape: BoxShape.circle),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, top: 30),
                                  child: Container(
                                    height: 6,
                                    width: 6,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade400,
                                        shape: BoxShape.circle),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 30, right: 10),
                              child: TextButton(
                                  onPressed: () {
                                    nextscreen(context, Homepage());
                                  },
                                  child: Text(
                                    "Skip",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  )),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 525),
                child: Center(
                  child: Positioned(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Appcolors.primarycolor,
                              minimumSize: Size(210, 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(22)))),
                          onPressed: () {
                            nextscreen(context, thirdSliderScreen());
                          },
                          child: Text(
                            "Get Started",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ))),
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }
}
