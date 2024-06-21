import 'package:digi_cart_furniture/component/appcolors.dart';
import 'package:digi_cart_furniture/component/widget.dart';
import 'package:digi_cart_furniture/screens/MyOrders/trackOrder.dart';
import 'package:flutter/material.dart';

class Pending extends StatefulWidget {
  const Pending({super.key});

  @override
  State<Pending> createState() => _PendingState();
}

class _PendingState extends State<Pending> {
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
        ? NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification overscroll) {
              overscroll.disallowIndicator();
              return size[0];
            },
            child: Column(
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
            ))
        : NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification overscroll) {
              overscroll.disallowIndicator();
              return size[0];
            },
            child: Padding(
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
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15, bottom: 15, left: 15),
                                    child: Image.asset(productImage[index]),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12, top: 20, right: 5),
                                    child: SizedBox(
                                      width: width / 1.9,
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
                                                top: 9, bottom: 8),
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
                                            padding:
                                                const EdgeInsets.only(left: 0),
                                            child: Container(
                                              height: 21,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey.shade100,
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: Center(
                                                child: Text(
                                                  "In Delivery",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 10,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              right: 5,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "${productListprice[index]} ",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)), backgroundColor: Appcolors
                                                            .primarycolor,
                                                        minimumSize:
                                                            Size(85, 30)),
                                                    onPressed: () {
                                                      nextscreen(
                                                          context,
                                                          TrackOrder(
                                                              image:
                                                                  productImage[
                                                                      index],
                                                              color:
                                                                  colors[index],
                                                              price:
                                                                  productListprice[
                                                                      index],
                                                              size_:
                                                                  size_[index],
                                                              name: productName[
                                                                  index],
                                                              qty: qty[index]));
                                                    },
                                                    child: Text(
                                                      "Track Order",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12),
                                                    ))
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
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
            ));
  }
}
