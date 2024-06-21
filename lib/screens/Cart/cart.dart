import 'package:digi_cart_furniture/component/appcolors.dart';
import 'package:digi_cart_furniture/component/widget.dart';
import 'package:digi_cart_furniture/screens/Cart/checkout.dart';
import 'package:flutter/material.dart';

class cart extends StatefulWidget {
  const cart(
      {super.key,
      this.productImage,
      this.productName,
      this.productListprice,
      this.productHideprice,
      this.size,
      this.colors,
      this.colorname,
      this.count});
  final productImage;
  final productName;
  final productListprice;
  final productHideprice;
  final size;
  final colors;
  final colorname;
  final count;

  @override
  State<cart> createState() => _cartState();
}

bool isDeleteTaped = false;

class _cartState extends State<cart> {
  // int length=(widget.productImage)+ length;
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
  List<int> productListprice = [
    4999,
    9999,
    2999,
  ];
  List productListHideprice = [
    "₹4999",
    "₹14999",
    "₹1999",
  ];
  List size = [
    "Size : Medium",
    "Size : Medium",
    "Size : Medium",
  ];
  List colors = [
    Color.fromARGB(255, 136, 112, 112),
    Colors.grey,
    Colors.blue,
  ];
  List colorName = [
    "Brown",
    "Gray",
    "Blue",
  ];
  int TotalPrice = 0;

  List<int>? count;
  int count_ = 0;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    count = List<int>.filled(productListprice.length, 1);
    // TotalPrice = productListprice.getRange(0, productListprice.length) as int;
    TotalPrice =
        productListprice[0] + productListprice[1] + productListprice[2];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Appcolors.primarycolor,
        centerTitle: true,
        title: Text(
          "Most Popular",
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        shadowColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              // scrollDirection: Axis.vertical,
              itemCount: productImage.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 15, right: 10, left: 10),
                  child: Card(
                    elevation: 1,
                    shadowColor: Colors.grey.shade400,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side:
                            BorderSide(width: 1, color: Colors.grey.shade200)),
                    child: Container(
                      // height: height * 0.178,
                      height: 140,
                     
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
                                crossAxisAlignment: CrossAxisAlignment.end,
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
                                              padding: const EdgeInsets.only(
                                                  right: 6),
                                              child: CircleAvatar(
                                                backgroundColor: colors[index],
                                                maxRadius: 10,
                                              ),
                                            ),
                                            Center(
                                              child: Text(
                                                "Color",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10, right: 10),
                                              child: Container(
                                                height: 13,
                                                width: 2,
                                                color: Colors.black54,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 0),
                                              child: Text(
                                                size[index],
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12),
                                              ),
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
                                                    "₹${productListprice[index]} ",
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
                                                              .grey.shade500,
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
                                                  color: Colors.grey.shade100,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10, right: 0),
                                                child: Row(
                                                  children: [
                                                    GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            count![index] > 1
                                                                ? count![
                                                                    index]--
                                                                : null;

                                                            // count![index] >=
                                                            //         1
                                                            //     ? TotalPrice =
                                                            //         TotalPrice -
                                                            //             productListprice[index]
                                                            //     : null;
                                                            count![index] > 1
                                                                ? TotalPrice =
                                                                    TotalPrice -
                                                                        productListprice[
                                                                            index]
                                                                : count![index] ==
                                                                        1
                                                                    ? TotalPrice = productListprice[0] +
                                                                        productListprice[
                                                                            1] +
                                                                        productListprice[
                                                                            2]
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
                                                        child: Icon(
                                                          Icons.horizontal_rule,
                                                          size: 16,
                                                        )),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 12,
                                                              right: 12),
                                                      child: Text(
                                                        count![index]
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
                                                            count![index]++;
                                                            TotalPrice =
                                                                TotalPrice +
                                                                    productListprice[
                                                                        index];
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
        ]),
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
                          productImage.length == 0
                              ? "₹0"
                              : "₹${TotalPrice.toString()}",
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
                                                "Qty : ${count![index]}",
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

                                  TotalPrice = TotalPrice -
                                      (count![index] * productListprice[index]);
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
