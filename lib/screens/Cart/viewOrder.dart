import 'package:flutter/material.dart';

import '../../component/appcolors.dart';

class ViewOrder extends StatefulWidget {
  const ViewOrder({super.key});

  @override
  State<ViewOrder> createState() => _ViewOrderState();
}

class _ViewOrderState extends State<ViewOrder> {
  var size, height, width;
  String? selectedValue;
  final List<String> items = ["Share E-Receipt", "Download E-Receipt", "Print"];

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
            "View Order",
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          actions: [
            PopupMenuButton(
              // padding: EdgeInsets.all(0),
              shadowColor: Colors.grey.shade400,
              position: PopupMenuPosition.under,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              icon: ImageIcon(
                AssetImage(
                  "assets/images/more.png",
                  // height: 10,
                ),
                size: 20,
              ),
              color: Colors.white,
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                      child: Container(
                    // height: 130,
                    // width: 130,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Image.asset("assets/images/Paper Download.png"),
                            Image.asset(
                              "assets/images/Send.png",
                              height: 20,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Share E-Receipt",
                              style: TextStyle(
                                  fontSize: 11, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                  )),
                  PopupMenuItem(
                      child: Container(
                    // height: 130,
                    // width: 130,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Divider(
                          height: 1,
                          thickness: 2,
                          color: Colors.grey.shade100,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12, bottom: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Image.asset("assets/images/Paper Download.png"),
                              Image.asset(
                                "assets/images/Paper Download.png",
                                height: 20,
                                // width: 13,
                              ),

                              Text(
                                "Download E-Receipt",
                                style: TextStyle(
                                    fontSize: 11, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          height: 1,
                          thickness: 2,
                          color: Colors.grey.shade100,
                        ),
                      ],
                    ),
                  )),
                  PopupMenuItem(
                      child: Container(
                    // height: 130,
                    // width: 130,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Image.asset("assets/images/Paper Download.png"),
                            Image.asset(
                              "assets/images/Document.png",
                              height: 20,
                            ),
                            SizedBox(
                              width: 10,
                            ),

                            Text(
                              "Print",
                              style: TextStyle(
                                  fontSize: 11, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                  )),
                ];
              },
            )
          ],
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
          child: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Column(children: [
              // SizedBox(
              //   height: height * 0.27,
              //   child: ListView.builder(
              //       itemCount: 2,
              //       itemBuilder: (context, index) {
              //         return cardWidget(
              //             name: "Wingback couch with part",
              //             qty: 1,
              //             size: "Size : Single",
              //             image:
              //                 "assets/images/istockphoto-1172283748-612x612 1.png",
              //             price: "₹4999");
              //       }),
              // ),
              cardWidget(
                  name: "Wingback couch with part",
                  qty: 1,
                  size: "Size : Single",
                  image: "assets/images/istockphoto-1172283748-612x612 1.png",
                  price: "₹4999"),
              cardWidget(
                  name: "High quality bed",
                  qty: 1,
                  size: "Size : Single",
                  image: "assets/images/istockphoto-956310980-612x612 1AS.png",
                  price: "₹9999"),
              Padding(
                  padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(
                              color: Colors.grey.shade300, width: 1)),
                      shadowColor: Colors.transparent,
                      // color: Color.fromARGB(95, 238, 238, 238),
                      child: Container(
                          // height: height * 0.327,
                          height: 260,
                          width: width,
                          child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, top: 15, right: 10, bottom: 15),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    PaymentList(
                                        name: "Amount", price: "₹1,970"),
                                    PaymentList(
                                        name: "Shipping", price: "₹160"),
                                    PaymentList(
                                        name: "Coupan discount",
                                        price: "-₹100"),
                                    PaymentList(
                                        name: "GST 28%", price: "-₹1200"),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 12,
                                        right: 12,
                                        top: 10,
                                      ),
                                      child: Divider(
                                        color: Colors.grey.shade100,
                                        thickness: 1,
                                        height: 1,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: PaymentList(
                                          name: "Total", price: "₹2,130"),
                                    ),
                                  ]))))),
              Padding(
                  padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(
                              color: Colors.grey.shade300, width: 1)),
                      shadowColor: Colors.transparent,
                      // color: Color.fromARGB(95, 238, 238, 238),
                      child: Container(
                          // height: height * 0.245,
                          height: 200,
                          width: width,
                          child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, top: 15, right: 10, bottom: 15),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    PaymentList(
                                        name: "Payment Methods",
                                        price: "Razorpay"),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15,
                                          right: 15,
                                          top: 10,
                                          bottom: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Date",
                                            style: TextStyle(
                                                color: Colors.black87,
                                                // fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 6, top: 0),
                                                child: Text(
                                                  "Dec 15,2024",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14),
                                                ),
                                              ),
                                              Container(
                                                height: 12,
                                                width: 2,
                                                color: Colors.black,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 6),
                                                child: Text(
                                                  "10:00:27 AM",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15,
                                            right: 15,
                                            top: 10,
                                            bottom: 10),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Transaction ID",
                                                style: TextStyle(
                                                    color: Colors.black87,
                                                    // fontWeight: FontWeight.bold,
                                                    fontSize: 14),
                                              ),
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 6, top: 0),
                                                    child: Text(
                                                      "SK7263727399",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 14),
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 6),
                                                      child: Image.asset(
                                                        "assets/images/copy.png",
                                                        height: 20,
                                                      )),
                                                ],
                                              ),
                                            ])),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15,
                                          right: 15,
                                          top: 0,
                                          bottom: 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Status",
                                            style: TextStyle(
                                                color: Colors.black87,
                                                // fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: Appcolors.primarycolor,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6)),
                                                  minimumSize: Size(8, 25)),
                                              onPressed: () {},
                                              child: Text(
                                                "Paid",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10),
                                              ))
                                        ],
                                      ),
                                    )
                                  ]))))),
              SizedBox(
                height: 30,
              )
            ]),
          ),
        ));
  }

  Widget cardWidget({
    required String name,
    required String image,
    required int qty,
    required String size,
    required String price,
  }) {
    return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 0),
        child: Card(
            shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(15)),
            shadowColor: Colors.transparent,
            // color: Color.fromARGB(95, 238, 238, 238),
            child: Container(
                height: 90,
                width: width,
                child: Padding(
                    padding: const EdgeInsets.only(
                        left: 0, top: 10, right: 0, bottom: 10),
                    child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(image),
                          maxRadius: 28,
                        ),
                        title: Text(
                          name,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Text(
                                "Qty : ${qty.toString()}",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                size,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        trailing: Text(
                          price.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ))))));
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
                color: Colors.black87,
                // fontWeight: FontWeight.bold,
                fontSize: 14),
          ),
          Text(
            price,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
          )
        ],
      ),
    );
  }
}
