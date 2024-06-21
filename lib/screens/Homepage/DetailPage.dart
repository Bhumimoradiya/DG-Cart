import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:digi_cart_furniture/component/appcolors.dart';
import 'package:digi_cart_furniture/component/widget.dart';
import 'package:digi_cart_furniture/screens/Cart/cartServices.dart';
import 'package:digi_cart_furniture/screens/reviewScreen.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:readmore/readmore.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
    required this.sliderpic,
    required this.quantity,
    required this.hideprice,
    required this.rate,
    required this.discount,
    required this.favourite,
    // required this.sliderpic,
    required this.id,
    required this.name,
    required this.price,
    // required this.hideprice,
    // required this.rate,
    // required this.discount,
    // required this.quantity,
    // required this.favourite
  });
  final List sliderpic;
  final quantity;
  final name;
  final id;
  // final Product product;
  final price;
  final hideprice;
  final rate;
  final discount;
  final bool favourite;
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  // Function to get the current user ID
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
      // int? currentid = FirebaseAuth.instance.currentUser.;
      // log("Email id ${currentid}");

      DocumentSnapshot<Map<String, dynamic>> snapshot =
          querysnapshot.docs.first;
      int userfield = snapshot.get('User_Id');
      log("user id ${userfield}");
      if (user != null) {
        return userfield;
      } else {
        // If the user is not authenticated, return null
        return null;
      }
    } catch (e) {
      print("Error ${e}");
    }
    return null;
  }

// Example usage in a Flutter widget
  Future<int?> someFunction() async {
    int? userId = await getCurrentUserId();

    if (userId != null) {
      print('User ID: $userId');
    } else {
      print('User not authenticated');
    }
    return userId;
  }

  String? selectedValue;
  final CartService cartService = CartService();
  // final Product product;
  late Color screenPickerColor;
  List colorname = ["Black", "Grey", "Blue", "Green"];
  List colors = [
    Colors.black,
    Colors.grey,
    Colors.blue,
    Color.fromARGB(255, 40, 110, 83),
  ];
  var size, height, width;
  int sliderindex = 0;
  bool isReadMore = false;
  bool currentindex = false;
  bool iconindex = false;

  int myindex = 0;
  final List<String> items = ["3×3", "4×3", "5×3", "5×4", "C type", "Single"];
  int count = 0;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context as BuildContext).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowIndicator();
          return size[0];
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 0, left: 0, right: 0),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        aspectRatio: 14 / 4,
                        height: height * 0.5,
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
                      items: widget.sliderpic.map((e) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: width,
                              // height: height * 0.2,
                              child: Image(
                                image: NetworkImage(e),
                                // height: height * 2,
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  Positioned(
                      child: AppBar(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    leading: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                          size: 20,
                        )),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: CircleAvatar(
                          maxRadius: 18,
                          backgroundColor: Colors.grey.shade200,
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.share_outlined,
                                color: Colors.black,
                                size: 20,
                              )),
                        ),
                      )
                    ],
                  )),
                  Positioned(
                    top: height * 0.465,
                    left: width * 0.45,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                        (index) => Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Container(
                            height: 6,
                            width: index == sliderindex ? 18 : 6,
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
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.name,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 21,
                              fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                currentindex = !currentindex;
                                iconindex = !iconindex;
                              });
                            },
                            icon: iconindex == true
                                ? Icon(
                                    Icons.favorite,
                                    size: 26,
                                    color: Appcolors.primarycolor,
                                  )
                                : Icon(
                                    Icons.favorite_border_outlined,
                                    size: 26,
                                  )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Row(
                      children: [
                        Container(
                          height: 20,
                          width: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color.fromARGB(202, 236, 189, 164)
                                  .withOpacity(0.4)),
                          child: Center(
                            child: Text(
                              "9,742 sold",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 11),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            nextscreen(context, reviewScreen());
                          },
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 6),
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
                                "${widget.rate} (4,449 reviews)",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 20),
                    child: Row(
                      children: [
                        Text(
                          "₹${widget.price}",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 5),
                          child: Text(
                            "₹${widget.hideprice.toString()}",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                // fontWeight: FontWeight.w500,
                                decoration: TextDecoration.lineThrough),
                          ),
                        ),
                        Text(
                          "(${widget.discount}% off)",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Description",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: ReadMoreText(
                      "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.",
                      style: TextStyle(color: Colors.grey.shade500),
                      trimLines: 2,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'view more..',
                      trimExpandedText: 'view less',
                      moreStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      lessStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(
                                  "Size",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Center(
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton2<String>(
                                    isExpanded: true,
                                    hint: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Choose your size',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    items: items
                                        .map((String item) =>
                                            DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ))
                                        .toList(),
                                    value: selectedValue,
                                    onChanged: (String? value) {
                                      setState(() {
                                        selectedValue = value;
                                      });
                                    },
                                    buttonStyleData: ButtonStyleData(
                                      height: 50,
                                      width: 165,
                                      padding: const EdgeInsets.only(
                                          left: 14, right: 14),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        boxShadow: [
                                          BoxShadow(color: Colors.transparent)
                                        ],
                                        border: Border.all(
                                          color: Colors.grey,
                                        ),
                                        color: Colors.white,
                                      ),
                                      elevation: 12,
                                    ),
                                    iconStyleData: const IconStyleData(
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                      ),
                                      iconSize: 25,
                                      iconEnabledColor: Colors.black,
                                      iconDisabledColor: Colors.grey,
                                    ),
                                    dropdownStyleData: DropdownStyleData(
                                      maxHeight: 150,
                                      padding: EdgeInsets.only(left: 30),
                                      width: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        color: Colors.white,
                                      ),
                                      offset: const Offset(-42, 10),
                                      scrollbarTheme: ScrollbarThemeData(
                                        mainAxisMargin: 5,
                                        crossAxisMargin: 10,
                                        radius: const Radius.circular(40),
                                        thickness:
                                            MaterialStateProperty.all<double>(
                                                6),
                                        thumbVisibility:
                                            MaterialStateProperty.all<bool>(
                                                true),
                                      ),
                                    ),
                                    menuItemStyleData: const MenuItemStyleData(
                                      height: 40,
                                      padding:
                                          EdgeInsets.only(left: 14, right: 14),
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                "Color",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 165,
                                  height: 40,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: colors.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(right: 5),
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                myindex = index;
                                              });
                                            },
                                            child: CircleAvatar(
                                              maxRadius: 18,
                                              backgroundColor: colors[index],
                                              child: myindex == index
                                                  ? Icon(Icons.check)
                                                  : Icon(null),
                                            ),
                                          ),
                                        );
                                      }),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Text(
                            "Quantity",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 19,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                count > 0 ? count-- : null;
                              });
                            },
                            child: Icon(
                              Icons.horizontal_rule,
                              size: 24,
                            )),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Text(
                            count.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                count++;
                              });
                            },
                            child: Icon(
                              Icons.add,
                              size: 24,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  )
                ]),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 85,
        width: width,
        // color: Colors.green,
        decoration: BoxDecoration(
            // border: Border.all(color: Colors.black, width: 1),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18), topRight: Radius.circular(18)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0, -1),
                  blurRadius: 13,
                  spreadRadius: 0.22,
                  blurStyle: BlurStyle.outer),
            ]),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 8, right: 8, bottom: 15, top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shadowColor: Colors.transparent, backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                          side: BorderSide(
                              width: 1, color: Appcolors.primarycolor)),
                      minimumSize: Size(167, 54)),
                  onPressed: () {
                    // nextscreen(context, CartScreen());
                    // nextscreen(
                    // context,
                    // cart(
                    //   productName: widget.name,
                    //   productHideprice: widget.hideprice,
                    //   productImage: widget.sliderpic,
                    //   productListprice: widget.price,
                    //   colorname: colorname,
                    //   colors: colors,
                    //   count: count,
                    //   size: items,
                    // ));
                  },
                  child: Text(
                    "Buy Now",
                    style: TextStyle(
                        color: Appcolors.primarycolor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shadowColor: Colors.transparent, backgroundColor: Appcolors.primarycolor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      minimumSize: Size(167, 54)),
                  onPressed: () async {
                    // nextscreen(
                    //     context,
                    //     cart(
                    //       productName: widget.name,
                    //       productHideprice: widget.hideprice,
                    //       productImage: widget.sliderpic,
                    //       productListprice: widget.price,
                    //       colorname: colorname,
                    //       colors: colors,
                    //       count: count,
                    //       size: items,
                    //     ));
                    // FirebaseFirestore.instance.collection('cart').doc().set({
                    //   'id': widget.id,
                    //   'image': widget.sliderpic,
                    //   'name': widget.name,
                    //   'price': widget.price,
                    //   'quantity': widget.quantity,
                    //   'hideprice': widget.hideprice,
                    //   'discount': widget.discount
                    // });
                    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    //   shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(12)),
                    //   dismissDirection: DismissDirection.down,
                    //   content: Text(
                    //     "Product added to cart successfully!!",
                    //     style: TextStyle(
                    //         fontWeight: FontWeight.bold, color: Colors.white),
                    //   ),

                    //   backgroundColor: Colors.orangeAccent,
                    //   behavior: SnackBarBehavior.floating,
                    //   // margin: EdgeInsets.only(top: 70),
                    //   duration: Duration(seconds: 2),
                    //   margin: EdgeInsets.only(
                    //     bottom: MediaQuery.of(context).size.height - 100,
                    //     left: 10,
                    //     right: 10,
                    //   ),
                    // ));
                    int? userId = await getCurrentUserId();
                    await cartService.addToCart(
                        userId!.toString(), widget.id.toString());
                    log("Userid : ${userId} Product id : ${widget.id}");
                    // Show a confirmation or navigate to the cart page
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Product added to cart'),
                      ),
                    );
                  },
                  child: Text(
                    "Add to cart",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
