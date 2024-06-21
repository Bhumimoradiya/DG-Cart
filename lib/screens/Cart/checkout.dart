import "package:digi_cart_furniture/component/appcolors.dart";
import "package:digi_cart_furniture/component/widget.dart";
import "package:digi_cart_furniture/screens/Cart/PaymentMethods.dart";
import "package:digi_cart_furniture/screens/Cart/shippingAddress.dart";
import "package:flutter/material.dart";

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

bool isDeleteTaped = false;

class _CheckOutState extends State<CheckOut> {
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
  List productListHideprice = [
    "₹4999",
    "₹14999",
    "₹1999",
  ];
  List size_ = [
    "Size : Medium",
    "Size : Medium",
    "Size : Medium",
  ];
  List colors = [
    Color.fromARGB(255, 136, 112, 112),
    Colors.grey,
    Colors.blue,
  ];
  List count = [0, 0, 0];
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          // elevation: 0,
          centerTitle: true,
          title: Text(
            "Checkout",
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
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 20),
                child: Text(
                  "Shipping Address",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 15, bottom: 10),
                child: GestureDetector(
                  onTap: () {
                    nextscreen(context, ShippingAddress());
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    shadowColor: Colors.transparent,
                    color: Color.fromARGB(95, 238, 238, 238),
                    child: Container(
                      height: 100,
                      width: width,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15, right: 10, bottom: 15, left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  shape: BoxShape.circle),
                              child: Padding(
                                padding: const EdgeInsets.all(7),
                                child: CircleAvatar(
                                  minRadius: 25,
                                  backgroundColor: Appcolors.primarycolor,
                                  child: Image.asset(
                                    "assets/images/LocationZA.png",
                                    height: 25,
                                  ),
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   width: 15,
                            // ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Home",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 17),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "61480 Sunbrook Park, PC 5679",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13),
                                )
                              ],
                            ),
                            // SizedBox(
                            //   width: 15,
                            // ),
                            Image.asset(
                              "assets/images/Edit.png",
                              height: 28,
                              alignment: Alignment.centerRight,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              divider(),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 10),
                child: Text(
                  "Order List",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    // scrollDirection: Axis.vertical,
                    itemCount: productImage.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(top: 15, right: 10, left: 10),
                        child: Card(
                          elevation: 1,
                          shadowColor: Colors.grey.shade400,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: BorderSide(
                                  width: 1, color: Colors.grey.shade200)),
                          child: Container(
                            // height: height * 0.178,
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
                                            bottomSheet(index);
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
                                              productName[index],
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 15),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 12, bottom: 12),
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
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
                                                          color: Colors.grey,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10,
                                                            right: 10),
                                                    child: Container(
                                                      height: 13,
                                                      width: 2,
                                                      color: Color.fromRGBO(
                                                          0, 0, 0, 0.541),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 0),
                                                    child: Text(
                                                      size_[index],
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 12),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 5),
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
                                                                color: Colors
                                                                    .grey
                                                                    .shade500,
                                                                decoration:
                                                                    TextDecoration
                                                                        .lineThrough))
                                                      ])),
                                                  // SizedBox(
                                                  //   width: 12,
                                                  // ),
                                                  Container(
                                                    height: 32,
                                                    width: 90,
                                                    decoration: BoxDecoration(
                                                        color: Colors
                                                            .grey.shade100,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10,
                                                              right: 0),
                                                      child: Row(
                                                        children: [
                                                          GestureDetector(
                                                              onTap: () {
                                                                setState(() {
                                                                  count[index] >
                                                                          0
                                                                      ? count[
                                                                          index]--
                                                                      : null;
                                                                });
                                                              },
                                                              child: Icon(
                                                                Icons
                                                                    .horizontal_rule,
                                                                size: 16,
                                                              )),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    left: 12,
                                                                    right: 12),
                                                            child: Text(
                                                              count[index]
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  // fontWeight:
                                                                  // FontWeight.bold,
                                                                  fontSize: 17),
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                              onTap: () {
                                                                setState(() {
                                                                  count[
                                                                      index]++;
                                                                });
                                                              },
                                                              child: Icon(
                                                                Icons.add,
                                                                size: 18,
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
                    }),
              ),
              divider(),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 8),
                child: Text(
                  "Promo Code",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, left: 15, right: 15, bottom: 8),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 8, left: 15, right: 15, bottom: 6),
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      cursorColor: Colors.grey.shade400,
                      decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          hintText: "Enter Promo Code",
                          focusedBorder: InputBorder.none,
                          hintStyle: TextStyle(
                            color: Colors.grey.shade400,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                          suffixIcon: TextButton(
                              onPressed: () {},
                              child: Text(
                                "APPLY",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.grey.shade500),
                              ))),
                    ),
                  ),
                ),
              ),
              divider(),
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 15, right: 15),
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side:
                            BorderSide(color: Colors.grey.shade300, width: 1)),
                    shadowColor: Colors.transparent,
                    // color: Color.fromARGB(95, 238, 238, 238),
                    child: Container(
                        // height: height * 0.36,
                        height: 270,
                        width: width,
                        child: Padding(
                            padding: const EdgeInsets.only(
                                left: 14, top: 15, right: 15, bottom: 15),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  PaymentList(name: "Amount", price: "₹1,970"),
                                  PaymentList(name: "Shipping", price: "₹160"),
                                  PaymentList(
                                      name: "Coupan discount", price: "-₹100"),
                                  PaymentList(name: "GST 28%", price: "-₹1200"),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 15,
                                      right: 15,
                                      top: 9,
                                    ),
                                    child: Divider(
                                      color: Colors.grey.shade200,
                                      thickness: 1,
                                      height: 1,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: PaymentList(
                                        name: "Total", price: "₹2,130"),
                                  ),
                                ])))),
              ),
              SizedBox(
                height: 30,
              )
            ])),
        bottomNavigationBar: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: width,
                  height: 100,
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
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 25, bottom: 25),
                    child: elevatedButton(
                        context, "Continue to Payment", PaymentMethods()),
                  ))
            ]));
  }

  Widget divider() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
      child: Divider(
        color: Colors.grey.shade200,
        thickness: 1,
        height: 1,
      ),
    );
  }

  Widget PaymentList({
    required String name,
    required String price,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(
                color: Colors.black54,
                // fontWeight: FontWeight.bold,
                fontSize: 14),
          ),
          Text(
            price,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
          )
        ],
      ),
    );
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
                                    child: Image.asset(
                                      productImage[index],
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
                                          productName[index],
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
                                                size_[index],
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
                                                "Qty : ${count[index]}",
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
