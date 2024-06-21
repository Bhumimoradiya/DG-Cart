import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../component/appcolors.dart';

class carouselslider extends StatefulWidget {
  const carouselslider({super.key});

  @override
  State<carouselslider> createState() => _carouselsliderState();
}

class _carouselsliderState extends State<carouselslider> {
  var size, height, width;
  int sliderindex = 0;
  List sliderPic = [
    "assets/images/19168737 1.png",
    "assets/images/19168737 1.png",

    // "assets/images/Frame 36896.png"
  ];
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context as BuildContext).size;
    height = size.height;
    width = size.width;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 35, left: 15, right: 15),
          child: CarouselSlider(
            options: CarouselOptions(
              height: height * 0.25,
              enableInfiniteScroll: true,
              viewportFraction: 1.0,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 5),
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
          top: height * 0.27,
          left: width * 0.45,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              sliderPic.length,
              (index) => Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Container(
                  height: 6,
                  width: 6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: index == sliderindex
                        ? Appcolors.primarycolor
                        : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
