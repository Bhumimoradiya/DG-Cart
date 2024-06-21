import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digi_cart_furniture/component/appcolors.dart';
import 'package:digi_cart_furniture/component/widget.dart';
import 'package:digi_cart_furniture/screens/Cart/checkout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Future<int?> getCurrentUserId() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    String? currentemail = FirebaseAuth.instance.currentUser!.email;
    try {
      QuerySnapshot<Map<String, dynamic>> querysnapshot =
          await FirebaseFirestore.instance
              .collection('User_Details')
              .where("Email_Id", isEqualTo: currentemail)
              .get();
      log("Email id ${currentemail}");

      DocumentSnapshot<Map<String, dynamic>> snapshot =
          querysnapshot.docs.first;
      int userfield = snapshot.get('User_Id');
      log("user id ${userfield}");
      if (user != null) {
        return userfield;
      } else {
        return null;
      }
    } catch (e) {
      print("Error ${e}");
    }
    return null;
  }

  var _Size, height, width;
  bool isDeleteTaped = false;
  List size = [
    "Size : Medium",
    "Size : Medium",
    "Size : Medium",
    "Size : Medium",
    "Size : Medium",
    "Size : Medium",
  ];
  List colors = [
    Color.fromARGB(255, 136, 112, 112),
    Colors.grey,
    Colors.blue,
    Color.fromARGB(255, 136, 112, 112),
    Colors.grey,
    Colors.blue,
  ];
  List colorName = [
    "Brown",
    "Gray",
    "Blue",
    "Brown",
    "Gray",
    "Blue",
  ];
  // int TotalPrice = 0;
  Future<void> calculateTotalprice(cartItemData, cartItems) async {
    if (cartItemData != null && cartItemData['price'] != null) {
      int len = cartItems.length;
      // int price = cartItemData['price'];
      double sum = 0;

      for (double i = 0; i < len; i++) {
        sum = (sum + cartItemData['price']);
        // print('i ' + i.toString() + ' amt: ' + sum.toString());
      }
      setState(() {
        TotalPrice = sum;
      });
    }
  }

  List<int>? count;
  int count_ = 0;
  // final FirebaseFirestore cartReference = FirebaseFirestore.instance.re;
  void deleteCartItem(int productid) async {
    int? userId = await getCurrentUserId();
    FirebaseFirestore.instance
        .collection('cart')
        .doc(userId.toString())
        .collection('products')
        .doc(productid.toString())
        .delete();
    log("cart item deleted : productid : ${productid} , userid : ${userId}");
  }

  double TotalPrice = 0;
  // void sumProducts() {
  //   for (var product in snapshot.data.documents) {
  //     double productPrice =
  //         product['price']; // Replace 'price' with your actual field name
  //     totalSum += productPrice;
  //   }
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserCartStream();
  }

  @override
  Widget build(BuildContext context) {
    _Size = MediaQuery.of(context).size;
    height = _Size.height;
    width = _Size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Most Popular',
          // style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Appcolors.primarycolor,
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: getUserCartStream(),
            builder:
                (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: CircularProgressIndicator(
                  backgroundColor: Appcolors.primarycolor.withOpacity(1),
                  // backgroundColor: Appcolors.primarycolor,
                  color: Colors.white,
                ));
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(
                  child: Text('Cart is empty.'),
                );
              } else {
                List<Map<String, dynamic>> cartItems = snapshot.data!;
                // double totalPrice = cartItems.fold(0, (previousValue, element) => previousValue + element);
                // int len = cartItemData!.length;
                // // int price = cartItemData['price'];
                // int? sum = 0;

                // for (int i = 0; i < len; i++) {
                //   sum = (sum! + cartItemData['price']) as int?;
                //   // print('i ' + i.toString() + ' amt: ' + sum.toString());
                // }
                // setState(() {
                //   TotalPrice = sum!;
                // });

                return RefreshIndicator(
                  displacement: 50,
                  backgroundColor: Appcolors.primarycolor,
                  color: Colors.white,
                  strokeWidth: 3,
                  triggerMode: RefreshIndicatorTriggerMode.onEdge,
                  onRefresh: () async {
                    await Future.delayed(const Duration(milliseconds: 1500));
                    setState(() {
                      getUserCartStream();
                    });
                  },
                  child: SizedBox(
                    height: height * 0.68,
                    child: ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        // setState(() {
                        // });
                        Map<String, dynamic> cartItemData = cartItems[index];
                        int productId = cartItemData["id"];
                        calculateTotalprice(cartItemData, cartItems);
                        log("length product id : ${productId.toString()}");
                        return FutureBuilder(
                          future: getProductDetails(productId.toString()),
                          builder: (context,
                              AsyncSnapshot<Map<String, dynamic>>
                                  productSnapshot) {
                            // if (productSnapshot.connectionState ==
                            //     ConnectionState.waiting) {
                            //   // return Center(
                            //   //   child: CircularProgressIndicator(
                            //   //     backgroundColor:
                            //   //         Appcolors.primarycolor.withOpacity(1),
                            //   //     // backgroundColor: Appcolors.primarycolor,
                            //   //     color: Colors.white,
                            //   //   ),
                            //   // );
                            // } else
                            // if (productSnapshot.hasError) {
                            //   return Text('Error: ${productSnapshot.error}');
                            // } else
                            if (!productSnapshot.hasData ||
                                productSnapshot.data!.isEmpty) {
                              return Center(
                                child: Text('Product details not found.'),
                              );
                            } else {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    top: 15, right: 10, left: 10),
                                child: Card(
                                  elevation: 1,
                                  shadowColor: Colors.grey.shade400,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      side: BorderSide(
                                          width: 1,
                                          color: Colors.grey.shade200)),
                                  child: Container(
                                    // height: height * 0.178,
                                    height: 140,

                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 15, bottom: 15, left: 15),
                                          child: Image.network(
                                              cartItemData['image'][0]),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 12, top: 10, right: 8),
                                          child: SizedBox(
                                            width: width / 1.93,
                                            child: Column(
                                              // mainAxisAlignment: MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      isDeleteTaped = true;
                                                    });
                                                    bottomSheet(
                                                        index, cartItemData);
                                                  },
                                                  child: Image.asset(
                                                    "assets/images/Group 71799.png",
                                                    height: 24,
                                                    // width: ,
                                                    // alignment: Alignment.centerLeft,
                                                  ),
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      cartItemData['name'],
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          fontSize: 14),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 12,
                                                              bottom: 12),
                                                      child: Row(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    right: 6),
                                                            child: CircleAvatar(
                                                              backgroundColor:
                                                                  colors[index],
                                                              maxRadius: 10,
                                                            ),
                                                          ),
                                                          Center(
                                                            child: Text(
                                                              "Color",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 12),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    left: 10,
                                                                    right: 10),
                                                            child: Container(
                                                              height: 13,
                                                              width: 2,
                                                              color: Colors
                                                                  .black54,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 0),
                                                            child: Text(
                                                              size[index],
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 12),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 5),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text.rich(TextSpan(
                                                              text:
                                                                  "₹${cartItemData['price']} ",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                              children: [
                                                                TextSpan(
                                                                    text:
                                                                        "₹3999",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            10,
                                                                        color: Colors
                                                                            .grey
                                                                            .shade500,
                                                                        decoration:
                                                                            TextDecoration.lineThrough))
                                                              ])),
                                                          // SizedBox(
                                                          //   width: 12,
                                                          // ),
                                                          Container(
                                                            height: 32,
                                                            width: 90,
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .grey
                                                                    .shade100,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15)),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      left: 10,
                                                                      right: 0),
                                                              child: Row(
                                                                children: [
                                                                  GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          count![index] > 1
                                                                              ? count![index]--
                                                                              : null;

                                                                          // count![index] >=
                                                                          //         1
                                                                          //     ? TotalPrice =
                                                                          //         TotalPrice -
                                                                          //             productListprice[index]
                                                                          //     : null;
                                                                          count![index] > 1
                                                                              ? TotalPrice = TotalPrice - int.parse(cartItemData['price'])
                                                                              : count![index] == 1
                                                                                  ? TotalPrice = cartItemData['price'] + cartItemData['price'] + cartItemData['price']
                                                                                  : null;
                                                                          //  count![index]!=1? TotalPrice = count![
                                                                          //               index] !=
                                                                          //           1
                                                                          //       ? TotalPrice -
                                                                          //           productListprice[
                                                                          //               index]!
                                                                          //       : TotalPrice:
                                                                          //       TotalPrice=productListprice[index]
                                                                          //       ;
                                                                        });
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .horizontal_rule,
                                                                        size:
                                                                            16,
                                                                      )),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            12,
                                                                        right:
                                                                            12),
                                                                    child: Text(
                                                                      count ==
                                                                              null
                                                                          ? "0"
                                                                          : count![index]
                                                                              .toString(),
                                                                      style: TextStyle(
                                                                          // fontWeight:
                                                                          // FontWeight.bold,
                                                                          fontSize: 17),
                                                                    ),
                                                                  ),
                                                                  GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          count![
                                                                              index]++;
                                                                          TotalPrice =
                                                                              TotalPrice + int.parse(cartItemData['price']);
                                                                        });
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .add,
                                                                        size:
                                                                            18,
                                                                      )),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
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
                            }
                          },
                        );
                      },
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: width,
            height: 90,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    blurStyle: BlurStyle.outer,
                    blurRadius: 5,
                    spreadRadius: 0.6,
                  )
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35))),
            child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child:
                    // isDeleteTaped == false
                    // ?
                    Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 3),
                          child: Text(
                            "Total Price",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ),
                        Text(
                          "₹${TotalPrice}",
                          style: TextStyle(
                              fontSize: 26,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    // elevatedButton(context, "Checkout", CheckOut())
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)), backgroundColor: Appcolors.primarycolor,
                            minimumSize: Size(180, 55)),
                        onPressed: () {
                          nextscreen(context, CheckOut());
                        },
                        child: Text(
                          "Checkout",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                )
                // : SizedBox(
                //     height: 200,
                //     child: BottomSheet(
                //         elevation: 2,
                //         onClosing: () {},
                //         builder: (context) {
                //           return Column(
                //             children: [],
                //           );
                //         }))
                // Text("Remove From Cart?")],
                ),
          )
        ],
      ),
    );
  }

  bottomSheet(index, cartitemdata) {
    return showModalBottomSheet(
        useSafeArea: false,
        elevation: 2,
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
          return SizedBox(
            height: height * 0.32,
            width: width,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 6, top: 5),
              child: Column(
                children: [
                  Container(
                    height: 2,
                    width: 30,
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      "Remove From Cart?",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                  Padding(
                      padding:
                          const EdgeInsets.only(top: 13, right: 20, left: 20),
                      child: Card(
                          elevation: 0,
                          shadowColor: Colors.grey.shade400,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          color: Colors.grey.shade100,
                          child: Container(
                              height: 130,
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15, bottom: 15, left: 0),
                                    child: Image.network(
                                      cartitemdata['image'][0],
                                      height: height * 0.16,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12, top: 22, right: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cartitemdata['name'],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w800,
                                              fontSize: 14),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 15, bottom: 15),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
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
                                                      fontSize: 12),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 6, right: 6),
                                                child: Container(
                                                  height: 11,
                                                  width: 2,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text(
                                                size[index],
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 6, right: 6),
                                                child: Container(
                                                  height: 11,
                                                  width: 2,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text(
                                                "Qty : ${count == null ? "0" : count![index].toString()}",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text.rich(TextSpan(
                                                  text:
                                                      "${cartitemdata['price']} ",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  children: [
                                                    TextSpan(
                                                        text: "₹3999",
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            color: Colors
                                                                .grey.shade500,
                                                            decoration:
                                                                TextDecoration
                                                                    .lineThrough))
                                                  ])),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )))),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 13, right: 13, bottom: 0, top: 5),
                    child: Row(
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
                                      borderRadius: BorderRadius.circular(25)),
                                  fixedSize: Size(162, 45)),
                              onPressed: () {
                                log('Product id for delete product ${cartitemdata['id']}');

                                deleteCartItem(cartitemdata['id']);
                                Navigator.pop(context);
                                // setState(() {
                                //   cartitemdata[index].removeAt(index);
                                //   Navigator.pop(context);

                                //   TotalPrice = TotalPrice -
                                //       (count![index] *
                                //           int.parse(cartitemdata['price']));
                                // });

                                // nextscreen(context,
                                //     cart());
                              },
                              child: Text(
                                "Remove",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  // Future<List<Map<String, dynamic>>> getUserCartStream() async {
  Future<List<Map<String, dynamic>>> getUserCartStream() async {
    User? user = FirebaseAuth.instance.currentUser;
    int? userId = await getCurrentUserId();
    log("user uid ${user!.uid}");
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('cart')
              .doc(userId.toString())
              .collection('products')
              .get();
      List<String> productIds =
          querySnapshot.docs.map((doc) => doc.id).toList();
      log("product IDs in cart: $productIds");

      List<Map<String, dynamic>> productsData = [];

      // Fetch product details for each product ID
      for (String productId in productIds) {
        Map<String, dynamic> productDetails =
            await getProductDetails(productId);
        log("Product details for $productId: $productDetails");

        productsData.add(productDetails);
      }

      log("All product details: $productsData");
      return productsData;
    } catch (e) {
      print("Error fetching document IDs: $e");
      return [];
    }
  }

  Future<Map<String, dynamic>> getProductDetails(String productId) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querysnapshot =
          await FirebaseFirestore.instance
              .collection('products')
              .where("id", isEqualTo: int.parse(productId))
              .get();
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          querysnapshot.docs.first;
      String name = snapshot.get('name');
      log("name ${name}");
      // DocumentSnapshot<Map<String, dynamic>> productSnapshot =
      //     await FirebaseFirestore.instance
      //         .collection('products')
      //         .doc(productId)
      //         .get();
      // log("Fetched product details for $productId: ${(productSnapshot.data() ?? {}).toString()}");
      return snapshot.data() ?? {};
    } catch (e) {
      print("Error fetching product details for $productId: $e");
      return {};
    }
  }
}
