import 'package:digi_cart_furniture/component/appcolors.dart';
import 'package:digi_cart_furniture/component/widget.dart';
import 'package:digi_cart_furniture/screens/Cart/cart.dart';
import 'package:flutter/material.dart';

class wishList extends StatefulWidget {
  const wishList({super.key});

  @override
  State<wishList> createState() => _wishListState();
}

class _wishListState extends State<wishList> {
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
  List productListprice = ["₹1199", "₹5999", "₹3999", "₹5999", "₹1599"];
  List productListHideprice = ["₹1599", "₹6499", "₹4999", "₹6999", "₹2999"];
  List size = [
    "Size . 7×4",
    "Size . Long",
    "Size . Long",
    "Size . 1 man",
    "Size . 7×4"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          // elevation: 0,
          centerTitle: true,
          title: Text(
            "My Wishlist",
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          shadowColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: 22,
              )),
          backgroundColor: Appcolors.primarycolor,
        ),
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowIndicator();
            return productImage[0];
          },
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
              right: 10,
              left: 10,
            ),
            child: SizedBox(
              height: height,
              width: width,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: productImage.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Card(
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(
                                width: 1, color: Colors.grey.shade200)),
                        child: Container(
                          height: 130,
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
                                    left: 10, top: 10, right: 10),
                                child: SizedBox(
                                  width: width / 1.89,
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          bottomSheet(index);
                                          //  setState(() {value -= 1; _selectedList.removeAt(index - 1);  });
                                        },
                                        child: Image.asset(
                                          "assets/images/Delete.png",
                                          height: 18,
                                          alignment: Alignment.topRight,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              productName[index],
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 14),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10),
                                              child: Text(
                                                size[index],
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text.rich(TextSpan(
                                                    text:
                                                        "${productListprice[index]} ",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    children: [
                                                      TextSpan(
                                                          text:
                                                              productListHideprice[
                                                                  index],
                                                          style: TextStyle(
                                                              fontSize: 10,
                                                              color: Colors.grey
                                                                  .shade500,
                                                              decoration:
                                                                  TextDecoration
                                                                      .lineThrough))
                                                    ])),

                                                // SizedBox(
                                                //   width: 34,
                                                // ),
                                                ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                        backgroundColor: Appcolors
                                                            .primarycolor,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            6)),
                                                        minimumSize:
                                                            Size(20, 27)),
                                                    onPressed: () {
                                                      nextscreen(
                                                          context, cart());
                                                    },
                                                    child: Text(
                                                      "Add To Cart",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                              ],
                                            ),
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
            ),
          ),
        ));
  }

  bottomSheet(index) {
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
              padding: const EdgeInsets.only(bottom: 8),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Container(
                      height: 2,
                      width: 30,
                      color: Colors.grey,
                    ),
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
                          const EdgeInsets.only(top: 15, right: 20, left: 20),
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
                                              top: 15, bottom: 12),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 0),
                                            child: Text(
                                              size[index],
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 11),
                                            ),
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
                                                      "${productListprice[index]} ",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  children: [
                                                    TextSpan(
                                                        text:
                                                            productListHideprice[
                                                                index],
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
                                setState(() {
                                  productImage.removeAt(index);
                                  Navigator.pop(context);
                                });
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
}
