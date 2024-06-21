import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digi_cart_furniture/component/widget.dart';
import 'package:digi_cart_furniture/screens/Homepage/DetailPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../component/appcolors.dart';

class productList_1 extends StatefulWidget {
  const productList_1({super.key});

  @override
  State<productList_1> createState() => _productList_1State();
}

class _productList_1State extends State<productList_1> {
  var size, height, width;

  List productListimage = [
    "assets/images/Rectangle 1234.png",
    "assets/images/aa.png",
    "assets/images/Rectangle 1234a.png",
    "assets/images/Rectangle 1234azsX.png",
  ];
  List productListname = [
    "Wingback couch with part",
    "Metal desk with laptop",
    "Wingback couch with part",
    "Metal desk with laptop"
  ];
  List productListprice = ["₹2999", "₹1999", "₹2999", "3999"];
  List productListHideprice = ["₹1199", "₹2499", "₹2899", "3299"];
  List currentindex = [false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    // List<ProductListModel> singlefoodlist = [];
    // log("productlist ${singlefoodlist}");
    // myProvider provider = Provider.of(context);
    // log("Provider ${provider}");

    return Column(
      children: [
        StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection("products").snapshots(),
            builder: (context, snapshot) {
              // if (snapshot.connectionState == ConnectionState.active) {
              //   if (snapshot.hasData) {
              //     return ListView.builder(
              //       itemCount: snapshot.data?.docs.length,
              //       itemBuilder: (context, index) {
              //         // You can access document fields using snapshot.data.docs[index]['field_name']
              //         return productList1();
              //       },
              //     );
              //   } else if (snapshot.hasError) {
              //     return Center(
              //       child: Text("${snapshot.hasError.toString()}"),
              //     );
              //   }
              // } else {
              //   return Center(child: CircularProgressIndicator());
              // }
              return SizedBox(
                  height: 270,
                  child: snapshot.connectionState == ConnectionState.active
                      ? snapshot.hasData
                          ? ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data?.docs.length,
                              itemBuilder: (context, index) {
                                // You can access document fields using snapshot.data.docs[index]['field_name']
                                log("product length ${snapshot.data!.docs.toString()}");
                                return Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, right: 5),
                                  child: GestureDetector(
                                    onTap: () {
                                      nextscreen(
                                          context,
                                          DetailPage(
                                            discount: "20",
                                            hideprice: "2999",
                                            name: snapshot
                                                .data!.docs[index]["name"]
                                                .toString(),
                                            price: snapshot
                                                .data!.docs[index]["price"]
                                                .toString(),
                                            rate: "4.5",
                                            id: snapshot.data!.docs[index]
                                                ["id"],
                                            quantity: snapshot.data!.docs[index]
                                                ["quantity"],
                                            favourite: currentindex[index],
                                            sliderpic: [
                                              snapshot
                                                  .data!.docs[index]["image"][0]
                                                  .toString(),
                                              snapshot
                                                  .data!.docs[index]["image"][1]
                                                  .toString(),
                                              snapshot
                                                  .data!.docs[index]["image"][2]
                                                  .toString()
                                            ],
                                          ));
                                    },
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Stack(
                                              children: [
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 1),
                                                    child: Image(
                                                      image: NetworkImage(
                                                        snapshot
                                                            .data!
                                                            .docs[index]
                                                                ["image"][0]
                                                            .toString(),
                                                      ),
                                                      height: height * 0.23,
                                                      width: 180,
                                                      fit: BoxFit.cover,
                                                    )),
                                                Positioned(
                                                  top: 1,
                                                  // right: 130,
                                                  // right: width * 0.35,
                                                  child: Container(
                                                    height: 18,
                                                    width: 60,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        15),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        15)),
                                                        color: Appcolors
                                                            .primarycolor),
                                                    child: Center(
                                                      child: Text(
                                                        "20% off",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 11),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                    top: 10,
                                                    left: width * 0.41,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          // currentindex[index] =
                                                          //     !currentindex[index];
                                                        });
                                                      },
                                                      child: CircleAvatar(
                                                        maxRadius: 12,
                                                        backgroundColor:
                                                            Colors.white,
                                                        child: Image(
                                                          image: AssetImage(
                                                            "assets/images/Heart 2.png",
                                                          ),
                                                          // color: currentindex[index]
                                                          //     ? Appcolors.primarycolor
                                                          //     : Colors.grey,
                                                          height: 15,
                                                        ),
                                                      ),
                                                    ))
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5, top: 5),
                                              child: Text(
                                                snapshot
                                                    .data!.docs[index]["name"]
                                                    .toString(),
                                                // productListname[index],
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 5),
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5, right: 3),
                                                    child: RatingBar(
                                                        itemSize: 19,
                                                        glow: false,
                                                        initialRating: 0,
                                                        direction:
                                                            Axis.horizontal,
                                                        allowHalfRating: true,
                                                        itemCount: 1,
                                                        ratingWidget:
                                                            RatingWidget(
                                                                full: const Icon(
                                                                    Icons.star,
                                                                    color: Appcolors
                                                                        .primarycolor),
                                                                half:
                                                                    const Icon(
                                                                  Icons
                                                                      .star_half,
                                                                  color: Appcolors
                                                                      .primarycolor,
                                                                ),
                                                                empty:
                                                                    const Icon(
                                                                  Icons
                                                                      .star_outline,
                                                                  color: Appcolors
                                                                      .primarycolor,
                                                                )),
                                                        onRatingUpdate:
                                                            (value) {
                                                          setState(() {});
                                                        }),
                                                  ),
                                                  Text(
                                                    "4.5(221))",
                                                    style: TextStyle(
                                                        color: Colors
                                                            .grey.shade600,
                                                        fontSize: 11),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 6),
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 7, right: 5),
                                                    child: Text(
                                                      " ₹${snapshot.data!.docs[index]["price"].toString()}",
                                                      // productListprice[index],
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  Text("₹2999",
                                                      // productListHideprice[index],
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors
                                                              .grey.shade500,
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough))
                                                ],
                                              ),
                                            )
                                          ]),
                                    ),
                                  ),
                                );
                                // Text(snapshot.data!.docs[index]["name"]
                                // .toString());
                              },
                            )
                          : snapshot.hasError
                              ? Center(
                                  child:
                                      Text("${snapshot.hasError.toString()}"),
                                )
                              : Center(child: CircularProgressIndicator())
                      : Center(child: CircularProgressIndicator()));
            }),
      ],
    );
  }

  Widget productList1() {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: GestureDetector(
        onTap: () {
          //   nextscreen(
          //       context,
          //       DetailPage(
          //           discount: "20% off",
          //           hideprice: productListHideprice[index],
          //           name: productListname[index],
          //           price: productListprice[index],
          //           rate: "4.5",
          //           favourite: currentindex[index],
          //           sliderpic: [
          //             productListimage[index],
          //             productListimage[index],
          //             productListimage[index],
          //             productListimage[index],
          //             productListimage[index],
          //           ]));
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Stack(
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 1),
                    child: Image(
                      image: AssetImage(""),
                      // height: height * 0.25,
                      width: 180,
                      fit: BoxFit.cover,
                    )),
                Positioned(
                  top: 1,
                  // right: 130,
                  // right: width * 0.35,
                  child: Container(
                    height: 18,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15)),
                        color: Appcolors.primarycolor),
                    child: Center(
                      child: Text(
                        "20% off",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 11),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: 10,
                    left: width * 0.41,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          // currentindex[index] =
                          //     !currentindex[index];
                        });
                      },
                      child: CircleAvatar(
                        maxRadius: 12,
                        backgroundColor: Colors.white,
                        child: Image(
                          image: AssetImage(
                            "assets/images/Heart 2.png",
                          ),
                          // color: currentindex[index]
                          //     ? Appcolors.primarycolor
                          //     : Colors.grey,
                          height: 15,
                        ),
                      ),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 5),
              child: Text(
                " product List name",
                // productListname[index],
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 3),
                    child: RatingBar(
                        itemSize: 19,
                        glow: false,
                        initialRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 1,
                        ratingWidget: RatingWidget(
                            full: const Icon(Icons.star,
                                color: Appcolors.primarycolor),
                            half: const Icon(
                              Icons.star_half,
                              color: Appcolors.primarycolor,
                            ),
                            empty: const Icon(
                              Icons.star_outline,
                              color: Appcolors.primarycolor,
                            )),
                        onRatingUpdate: (value) {
                          setState(() {});
                        }),
                  ),
                  Text(
                    "4.5  (221)",
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 11),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 7, right: 5),
                    child: Text(
                      "Product List Price",
                      // productListprice[index],
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text("productListHideprice",
                      // productListHideprice[index],
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade500,
                          decoration: TextDecoration.lineThrough))
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
