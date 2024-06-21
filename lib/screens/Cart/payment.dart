import 'package:digi_cart_furniture/component/appcolors.dart';
import 'package:digi_cart_furniture/component/widget.dart';
import 'package:digi_cart_furniture/screens/Cart/viewOrder.dart';
import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  var size, height, width;
  int currentIndex = 1;
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
            "Payment",
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 15, bottom: 25),
                child: Text(
                  "Select the payment you want to use.",
                  style: TextStyle(color: Colors.black54, fontSize: 16),
                ),
              ),
              cardWidget(
                  name: "Razorpay",
                  image: "assets/images/62cc1d95150d5de9a3dad5fa 1.png",
                  currentindex: 1),
              cardWidget(
                  name: "PayU",
                  image: "assets/images/PayU 1.png",
                  currentindex: 2),
              cardWidget(
                  name: "Instamojo",
                  image: "assets/images/unnamed 1.png",
                  currentindex: 3),
              cardWidget(
                  name: "PayPal",
                  image: "assets/images/PayPal-Logo 1.png",
                  currentindex: 4),
            ],
          ),
        ),
        bottomNavigationBar: Row(children: [
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
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)), backgroundColor: Appcolors.primarycolor,
                        minimumSize: Size(300, 55)),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              icon: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Image.asset(
                                  "assets/images/Group.png",
                                  height: 150,
                                ),
                              ),
                              title: Text(
                                "Order Successful !",
                                style: TextStyle(
                                    color: Appcolors.primarycolor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              content: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15),
                                child: Text(
                                  "You have successfully made order",
                                  style: TextStyle(
                                      color: Appcolors.primarycolor,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              actions: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  child: Column(
                                    children: [
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              shadowColor: Colors.transparent, backgroundColor: Appcolors.primarycolor,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25)),
                                              minimumSize: Size(200, 50)),
                                          onPressed: () {
                                            nextscreen(context, ViewOrder());
                                          },
                                          child: Center(
                                            child: Text(
                                              "View Order",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, bottom: 20),
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shadowColor: Colors.transparent, backgroundColor: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        width: 1,
                                                        color: Appcolors
                                                            .primarycolor),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                minimumSize: Size(200, 50)),
                                            onPressed: () {
                                              // nextscreen(context, null);
                                              nextscreen(context, ViewOrder());
                                              // Navigator.pop(context);
                                            },
                                            child: Center(
                                              child: Text(
                                                "View E-Receipt",
                                                style: TextStyle(
                                                    color:
                                                        Appcolors.primarycolor,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )),
                                      )
                                    ],
                                  ),
                                )
                              ],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            );
                            //  Padding(
                            //   padding: const EdgeInsets.only(left: 5, right: 5),
                            //   child: Container(
                            //     height: 300,
                            //     width: width,
                            //     decoration: BoxDecoration(color: Colors.black),
                            //     child: Column(
                            //       children: [
                            // Image.asset("assets/images/Group.png")
                            //       ],
                            //     ),
                            //   ),
                            // );
                          });
                    },
                    child: Center(
                      child: Text(
                        "Continue",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
              ))
        ]));
  }

  Widget cardWidget({
    required String name,
    required String image,
    required int currentindex,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = currentindex;
        });
      },
      child: Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child: Card(
              shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(20)),
              shadowColor: Colors.transparent,
              // color: Color.fromARGB(95, 238, 238, 238),
              child: Container(
                  height: 80,
                  width: width,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          left: 0, top: 10, right: 0, bottom: 10),
                      child: ListTile(
                        title: Text(
                          name,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 18),
                        ),
                        leading: Image.asset(
                          image,
                          height: 25,
                        ),
                        trailing: Radio<int>(
                          fillColor: MaterialStateColor.resolveWith((states) =>
                              currentIndex == currentindex
                                  ? Appcolors.primarycolor
                                  : Colors.grey.shade300),
                          value: currentindex,
                          groupValue: currentIndex,
                          onChanged: (int? value) {
                            setState(() {
                              currentIndex = value!;
                            });
                          },
                        ),
                      ))))),
    );
  }
}
