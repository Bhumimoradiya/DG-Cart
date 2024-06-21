import 'package:digi_cart_furniture/component/widget.dart';
import 'package:digi_cart_furniture/screens/sliderscreen/slide.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

import '../../component/appcolors.dart';
import '../Authentication/Login/login.dart';

class slider_page extends StatefulWidget {
  slider_page({Key? key, required this.model, required this.currentindex})
      : super(key: key);
  final slide model;
  final int currentindex;

  @override
  State<slider_page> createState() => _slider_pageState();
}

final controller = LiquidController();

class _slider_pageState extends State<slider_page> {
  var size, height, width;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Stack(children: [
            Container(
              height: height,
              width: width,
              color: Colors.white,
            ),
            // Container(
            //   height: 759,
            //   color: Colors.white,
            // ),
            // Image.asset(widget.model.imageurl),
            Container(
              // height: height * 0.73,
              height: height / 1.27,
              // height: 759,
              // padding: EdgeInsets.only(top: 0),
              width: width,
              decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                      image: AssetImage(widget.model.imageurl
                          // "assets/images/aestheticroom.png",
                          ),
                      // filterQuality: FilterQuality.medium,
                      // scale: 0.1,
                      fit: BoxFit.cover,
                      // alignment: Alignment.center,
                      repeat: ImageRepeat.noRepeat,
                      opacity: 70)),
            ),

            Positioned(
              top: height / 1.32,
              child: Container(
                // height: height * 0.260,
                height: 215,
                width: width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: Padding(
                  padding: const EdgeInsets.only(top: 39),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                          child: Text(
                        // slidelist[index].title,
                        widget.model.title,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      )),
                      Center(
                          child: Text(
                        // slidelist[index].title2,
                        widget.model.title2,

                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      )),
                      Center(
                          child: Text(
                        // slidelist[index].title3,
                        widget.model.title3,

                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      )),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 25, top: 20),
                                  child: Container(
                                    height: 6,
                                    width: 6,
                                    decoration: BoxDecoration(
                                        // color: widget.model.color,
                                        color: widget.currentindex == 0
                                            ? Appcolors.primarycolor
                                            : Colors.grey.shade400,
                                        shape: BoxShape.circle),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, top: 20),
                                  child: Container(
                                    height: 6,
                                    width: 6,
                                    decoration: BoxDecoration(
                                        color: widget.currentindex == 1
                                            ? Appcolors.primarycolor
                                            : Colors.grey.shade400,
                                        // color: widget.model.color,
                                        shape: BoxShape.circle),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, top: 20),
                                  child: Container(
                                    height: 6,
                                    width: 6,
                                    decoration: BoxDecoration(
                                        // color: currentindex == 2

                                        color: widget.currentindex == 2
                                            ? Appcolors.primarycolor
                                            : Colors.grey.shade400,
                                        shape: BoxShape.circle),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, right: 10),
                              child: TextButton(
                                  style: ButtonStyle(
                                      overlayColor: MaterialStatePropertyAll(
                                          Colors.transparent)),
                                  onPressed: () {
                                    nextscreen(context, login());
                                  },
                                  child: Text(
                                    "Skip ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  )),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.only(top: 525),
            //   child: Center(
            //     child: Positioned(
            //         child: ElevatedButton(
            //             style: ElevatedButton.styleFrom(
            //                 primary: Appcolors.primarycolor,
            //                 minimumSize: Size(210, 50),
            //                 shape: RoundedRectangleBorder(
            //                     borderRadius:
            //                         BorderRadius.all(Radius.circular(22)))),
            //             onPressed: () {
            //               // if (currentindex == 0 || currentindex == 1) {
            //               //   _controller.nextPage(
            //               //       duration: Duration(microseconds: 100),
            //               //       curve: Curves.bounceIn);
            //               // }
            //               setState(() {
            //                 // currentpage = !currentpage;
            //                 // currentindex = (!currentindex) as int;
            //               });
            //               int nextpage = controller.widget.current + 1;
            //               controller.animateToPage(page: widget.currentindex);
            //               // if (currentpage == 2) {
            //               //   nextscreen(context, login());
            //               // }
            //             },
            //             child: Text(
            //               "Get Started",
            //               style: TextStyle(
            //                   fontSize: 18, fontWeight: FontWeight.bold),
            //             ))),
            //   ),
            // )
          ]),
        ));
  }
}
