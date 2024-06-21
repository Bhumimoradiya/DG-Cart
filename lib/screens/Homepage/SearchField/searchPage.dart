import 'package:digi_cart_furniture/component/widget.dart';
import 'package:digi_cart_furniture/screens/Homepage/SearchField/sort&Filter.dart';
import 'package:flutter/material.dart';

class searchPage extends StatefulWidget {
  const searchPage({super.key});

  @override
  State<searchPage> createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {
  List productImage = [
    "assets/images/istockphoto-1138159883-612x612 1.png",
    "assets/images/istockphoto-1316641487-612x612 1.png",
    "assets/images/istockphoto-1172283748-612x612 1.png",
    "assets/images/istockphoto-1172283748-612x612 1asx.png",
    "assets/images/istockphoto-956310980-612x612 1AS.png"
  ];
  List productName = [
    "Contempory luxury bed",
    "Bridal wedding attribute",
    "Wingback couch with part",
    "Metal desk with laptop chair",
    "High Quality bed"
  ];
  List productListprice = ["₹1199", "₹5999", "₹3999", "₹5999", "₹15999"];
  List productListHideprice = ["₹1599", "₹6499", "₹4999", "₹6999", "₹29999"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowIndicator();
            return productImage[0];
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 10),
                    child: Row(
                      children: [
                        Container(
                            width: width * 0.79,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: Colors.grey.shade200),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                              cursorColor: Colors.grey,
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 0),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(40)),
                                      borderSide: BorderSide.none),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(40)),
                                      borderSide: BorderSide.none),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  hintText: "Search here..",
                                  hintStyle: TextStyle(fontSize: 14),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: ImageIcon(
                                      AssetImage(
                                        "assets/images/SearchBlack.png",
                                      ),
                                      size: 5,
                                      color: Colors.black,
                                    ),
                                  ),
                                  prefixIconColor: Colors.grey,
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        nextscreen(context, Sort_Filter());
                                      },
                                      icon: ImageIcon(
                                        AssetImage(
                                          "assets/images/Filter.png",
                                        ),
                                        size: 21,
                                        color: Colors.black,
                                      ))),
                            )),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.85,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: productImage.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                right: 10, left: 10, bottom: 10),
                            child: Card(
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: BorderSide(
                                      width: 1, color: Colors.grey.shade200)),
                              child: Container(
                                height: 90,
                                decoration: BoxDecoration(),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, bottom: 10, left: 8),
                                      child: Image.asset(productImage[index]),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 15,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                productName[index],
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10),
                                                child: Row(
                                                  children: [
                                                    Text.rich(TextSpan(
                                                        text:
                                                            "${productListprice[index]} ",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                        children: [
                                                          TextSpan(
                                                              text:
                                                                  productListHideprice[
                                                                      index],
                                                              style: TextStyle(
                                                                  fontSize: 11,
                                                                  color: Colors
                                                                      .grey
                                                                      .shade400,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .lineThrough))
                                                        ])),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
