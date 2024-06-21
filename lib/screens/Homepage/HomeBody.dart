import 'package:digi_cart_furniture/screens/Homepage/mostPopular.dart';
import 'package:digi_cart_furniture/screens/Homepage/productList_1.dart';
import 'package:digi_cart_furniture/screens/Homepage/productList_2.dart';
import 'package:digi_cart_furniture/screens/Homepage/productList_3.dart';
import 'package:digi_cart_furniture/screens/Homepage/productList_4.dart';
import 'package:digi_cart_furniture/component/appcolors.dart';
import 'package:digi_cart_furniture/screens/viewAll.dart';
import 'package:flutter/material.dart';
import 'HomeProductList.dart';
import 'SearchField/HomeSearchField.dart';
import 'Home_widget.dart';
import 'carouselSlider.dart';
import 'carouselSlider2.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  var size, height, width;
  List productListimage = [
    "assets/images/istockphoto-1285148665-612x612 1.png",
    "assets/images/istockphoto-1287372078-612x612 1.png",
    "assets/images/istockphoto-1253531584-612x612 1.png"
  ];
  List listName = ["All", "Sofa", "Chair", "Slipper Sofa", "Bed"];
  int currentIndex = 1;

  int sliderindex = 0;
  int productindex = 0;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return SingleChildScrollView(
        child: Column(children: [
      HomeProductList(),
      SizedBox(
        height: height * 0.04,
      ),
      Stack(children: [
        Padding(
          padding: const EdgeInsets.only(top: 26, bottom: 0),
          child: Container(
            height: height * 0.2631,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45))),
          ),
        ),
        HomeSearchField(),
        carouselslider(),
      ]),
      Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: ProductNameViewall(context,
                  page: MostPopular(),
                  name: "Most Popular",
                  color: Colors.black),
            ),
            ListProductName(),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: productList_1(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Image(
                image: AssetImage(
                  "assets/images/Frame 36896.png",
                ),
                width: width,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top Categories",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    // SizedBox(
                    //   width: width * 0.5,
                    // ),
                    TextButton(
                      style: ButtonStyle(
                          overlayColor:
                              MaterialStatePropertyAll(Colors.transparent)),
                      onPressed: () {
                        // Bottomsheet();
                      },
                      child: Text(
                        "View All",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: productList_2(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: productList_3(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
              child: productList_4(),
            ),
            carouselSlider2(),
            Stack(
              children: [
                Container(
                  height: 120,
                  width: width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.orange,
                    Appcolors.primarycolor,
                    Colors.yellow.shade600
                  ])),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: ProductNameViewall(context,
                        page: viewAll(),
                        name: "Deal of Day",
                        color: Colors.white),
                  ),
                ),

                // Padding(
                //   padding: const EdgeInsets.only(left: 8.0, right: 8),
                //   child: ProductNameViewall(context,
                //       page: viewAll(),
                //       name: "Top Categories",
                //       color: Colors.black),
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: SizedBox(
                      height: 210,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: productListimage.length,
                          itemBuilder: (context, index) {
                            return Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, top: 40),
                                  child: Image(
                                    image: AssetImage(productListimage[index]),
                                    height: 150,
                                  ),
                                ),
                                Positioned(
                                  // top: height * 0.214,
                                  top: 168,
                                  left: 10,
                                  child: Container(
                                    height: 20,
                                    width: 115,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.6),
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(9),
                                            bottomRight: Radius.circular(9))),
                                    child: Center(
                                      child: Text(
                                        "Under ₹1999",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            );
                          })),
                )
              ],
            ),
          ],
        ),
      ),
    ]));
  }

  Widget ListProductName() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8),
      child: SizedBox(
        height: 35,
        width: width * 2,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: listName.length,
            itemBuilder: ((BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: index == productindex
                            ? Appcolors.primarycolor
                            : Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18))),
                    onPressed: () {
                      setState(() {
                        productindex = index;
                      });
                    },
                    child: Text(
                      listName[index],
                      style: TextStyle(
                          color: index == productindex
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.bold),
                    )),
              );
            })),
      ),
    );
  }
}
