import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../component/appcolors.dart';

class carouselSlider2 extends StatefulWidget {
  const carouselSlider2({super.key});

  @override
  State<carouselSlider2> createState() => _carouselSlider2State();
}

class _carouselSlider2State extends State<carouselSlider2> {
  var size, height, width;

  List sliderPic = [
    "assets/images/3d-rendering-mock-up-wood-decor-living-room-with-leather-sofa 1.png",
    "assets/images/image 52.png",
    "assets/images/image 49.png",
    "assets/images/image 51.png",
    "assets/images/image 54.png",
  ];
  int sliderindex = 0;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection("sliderImage").snapshots(),
        builder: (context, snapshot) {
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 15, right: 15),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: height * 0.25,
                    enableInfiniteScroll: true,
                    viewportFraction: 1.0,
                    autoPlay: true,
                    // autoPlayInterval: Duration(seconds: 5),
                    onPageChanged: (index, reason) {
                      setState(() {
                        sliderindex = index;
                      });
                    },
                  ),
                  items: sliderPic.map((e) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: width,
                          decoration: BoxDecoration(
                              // borderRadius: BorderRadius.circular(50),
                              // border: Border.all(color: Colors.grey)
                              ),
                          // height: height * 0.5,
                          child: Image(
                            image: AssetImage(e),
                            fit: BoxFit.fitWidth,
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              Positioned(
                top: height * 0.215,
                left: width * 0.45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    sliderPic.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Container(
                        height: 6,
                        width: 6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: index == sliderindex
                              ? Appcolors.primarycolor
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
