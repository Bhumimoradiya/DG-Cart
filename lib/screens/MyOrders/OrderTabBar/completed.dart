import 'package:digi_cart_furniture/component/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Completed extends StatefulWidget {
  const Completed({super.key});

  @override
  State<Completed> createState() => _CompletedState();
}

class _CompletedState extends State<Completed> {
  final bool HaveProduct = true;
  var size, height, width;
  List productImage = [
    "assets/images/istockphoto-1172283748-612x612 1.png",
    "assets/images/istockphoto-956310980-612x612 1AS.png",
    "assets/images/Rectangle 123.png",
  ];
  List productName = [
    "Wingback couch with part",
    "High Quality bed",
    "Empty table chair"
  ];
  List productListprice = [
    "₹4999",
    "₹9999",
    "₹2999",
  ];

  List size_ = [
    "Size : M",
    "Size : M",
    "Size : M",
  ];
  List qty = [
    "Qty : 1",
    "Qty : 1",
    "Qty : 1",
  ];
  List colors = [
    Colors.grey,
    Colors.grey.shade300,
    Colors.blue,
  ];
  List colorName = [
    "Brown",
    "Gray",
    "Blue",
  ];
  List count = [0, 0, 0];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return HaveProduct == false
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/OBJECT.png",
                height: height * 0.12,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 15),
                child: Text(
                  "You don't have an order yet",
                  style: TextStyle(
                      color: Appcolors.primarycolor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                "You don't have an ongoing orders at this time",
                style: TextStyle(
                    color: Appcolors.primarycolor.withOpacity(0.4),
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              )
            ],
          )
        : Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
              right: 10,
              left: 10,
            ),
            child: Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    // scrollDirection: Axis.vertical,
                    itemCount: productImage.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: Card(
                          elevation: 1,
                          shadowColor: Colors.grey.shade200,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: BorderSide(
                                  width: 1, color: Colors.grey.shade100)),
                          child: Container(
                            height: 140,
                            decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(15),
                                // boxShadow: [
                                //   BoxShadow(
                                //       color: Colors.grey,
                                //       blurRadius: 0.12,
                                //       spreadRadius: 2,
                                //       blurStyle: BlurStyle.outer)
                                // ]
                                ),
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15, bottom: 15, left: 15),
                                  child: Image.asset(productImage[index]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12, top: 20, right: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        productName[index],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 14),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8, bottom: 9),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 6),
                                              child: CircleAvatar(
                                                backgroundColor: colors[index],
                                                maxRadius: 7,
                                              ),
                                            ),
                                            Center(
                                              child: Text(
                                                "Color",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 6, right: 6),
                                              child: Container(
                                                height: 11,
                                                width: 2,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Text(
                                              size_[index],
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 10),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 6, right: 6),
                                              child: Container(
                                                height: 11,
                                                width: 2,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Text(
                                              qty[index],
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 10),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 0),
                                        child: Container(
                                          height: 21,
                                          width: 60,
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade100,
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Center(
                                            child: Text(
                                              "Completed",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: width / 1.9,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "${productListprice[index]} ",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)), backgroundColor: Appcolors.primarycolor,
                                                    minimumSize: Size(85, 30)),
                                                onPressed: () {
                                                  // nextscreen(context, null);
                                                  bottomSheet(index);
                                                },
                                                child: Text(
                                                  "Review",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12),
                                                )),
                                          ],
                                        ),
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
              ],
            ),
          );
  }

  bottomSheet(index) {
    return showModalBottomSheet(
        useSafeArea: false,
        elevation: 2,
        // barrierColor: Colors.grey.shade100,
        enableDrag: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  35,
                ),
                topRight: Radius.circular(
                  35,
                ))),
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SizedBox(
                  height: 500,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Container(
                        height: 2,
                        width: 30,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Text(
                        "Leave a Review",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 30, right: 30, top: 15),
                      child: Divider(
                        height: 1,
                        color: Colors.grey.shade100,
                        thickness: 2,
                      ),
                    ),
                    Padding(
                        padding:
                            const EdgeInsets.only(top: 15, right: 20, left: 20),
                        child: Card(
                            elevation: 0,
                            shadowColor: Colors.grey.shade400,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1, color: Colors.grey.shade200),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            color: Colors.white,
                            child: Container(
                                height: 130,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15, bottom: 15, left: 0),
                                      child: Image.asset(
                                        productImage[index],
                                        height: height * 0.16,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 22, top: 22),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            productName[index],
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w800,
                                                fontSize: 14),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8, bottom: 8),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 6),
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        colors[index],
                                                    maxRadius: 7,
                                                  ),
                                                ),
                                                Center(
                                                  child: Text(
                                                    "Color",
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 10),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 6, right: 6),
                                                  child: Container(
                                                    height: 11,
                                                    width: 2,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                Text(
                                                  size_[index],
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 10),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 6, right: 6),
                                                  child: Container(
                                                    height: 11,
                                                    width: 2,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                Text(
                                                  qty[index],
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 10),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 5),
                                            child: Container(
                                              height: 25,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey.shade100,
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: Center(
                                                child: Text(
                                                  "Completed",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 10,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(right: 5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text.rich(TextSpan(
                                                  text:
                                                      "${productListprice[index]} ",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )))),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 30, right: 30, top: 15),
                      child: Divider(
                        height: 1,
                        color: Colors.grey.shade100,
                        thickness: 2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Text(
                        "How is your order?",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        "Please give your rating & also your review...",
                        style: TextStyle(
                            color: Colors.black,
                            // fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18),
                      child: RatingBar(
                          itemSize: 35,
                          itemPadding: EdgeInsets.only(left: 15),
                          glow: false,
                          initialRating: 0,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          ratingWidget: RatingWidget(
                              full: const Icon(Icons.star,
                                  color: Appcolors.primarycolor),
                              half: const Icon(
                                Icons.star_half,
                                color: Appcolors.primarycolor,
                              ),
                              empty: const Icon(
                                Icons.star_outline_outlined,
                                color: Appcolors.primarycolor,
                              )),
                          onRatingUpdate: (value) {
                            setState(() {});
                          }),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 18, left: 10, right: 10),
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                                width: 1, color: Appcolors.primarycolor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                                width: 1, color: Appcolors.primarycolor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                                width: 1, color: Appcolors.primarycolor),
                          ),
                          hintText: "Enter your review!!",
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(
                                top: 12, bottom: 12, left: 10),
                            child: ImageIcon(
                              AssetImage(
                                "assets/images/Image 3.png",
                              ),
                              size: 2,
                              color: Appcolors.primarycolor,
                            ),
                          ),
                        ),
                        cursorColor: Colors.black,
                        cursorHeight: 18,
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 13, right: 13, top: 30),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shadowColor: Colors.transparent, backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      side: BorderSide(
                                          width: 1,
                                          color: Appcolors.primarycolor)),
                                  fixedSize: Size(162, 45)),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                    color: Appcolors.primarycolor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shadowColor: Colors.transparent, backgroundColor: Appcolors.primarycolor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    fixedSize: Size(162, 45)),
                                onPressed: () {
                                  // nextscreen(context,
                                  //     cart());
                                },
                                child: Text(
                                  "Submit",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )),
                          )
                        ],
                      ),
                    ),
                  ])));
        });
  }
}
