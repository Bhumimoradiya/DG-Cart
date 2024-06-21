import 'package:digi_cart_furniture/component/appcolors.dart';
import 'package:dotted_line/dotted_line.dart';

import 'package:flutter/material.dart';

class TrackOrder extends StatefulWidget {
  const TrackOrder(
      {super.key,
      required this.image,
      required this.color,
      required this.price,
      required this.size_,
      required this.name,
      required this.qty});
  final image;
  final color;
  final price;
  final size_;
  final name;
  final qty;
  @override
  State<TrackOrder> createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  var size, height, width;
  List title = [
    "Order in Transit - Dec 17",
    "Order ... Custom Part - Dec 16",
    "Order are ... Shipped - Dec 15",
    "Order is in Packing - Dec 15",
    "Verified Payments - Dec 15",
  ];
  List subtitle = [
    "32 Manchester Ave Ringgold, GA 30736",
    "4 Evergreen Street Loke Zurich. IL 60047",
    "9177 Hillcrest Street Wheeling. WV 26003",
    "891 Glen Ridge St.Ganesville. VA 20155",
    "55 Summerhouse Dr.Apopka. FL 32703",
  ];
  List time = ["15:20 PM", "14:40 AM", "11:30 AM", "10:25 PM", "10:24 AM"];

  @override
  Widget build(BuildContext context) {
    void _onselectedchoice(result) {
      if (result == 0) {
        showModalBottomSheet(
            useSafeArea: false,
            elevation: 2,
            enableDrag: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      25,
                    ),
                    topRight: Radius.circular(
                      25,
                    ))),
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return SizedBox(
                height: 210,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Container(
                        height: 2,
                        width: 32,
                        color: Colors.grey.shade300,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Text(
                        "Are you sure you want to\ncancel this order?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 25, right: 25, top: 40),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)), backgroundColor: Appcolors.primarycolor,
                              minimumSize: Size(300, 55)),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Center(
                            child: Text(
                              "Order Cancel",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    )
                  ],
                ),
              );
            });
      }
      // nextscreen(context, Pending());
    }

    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    // var _onselectedchoice;
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
              onSelected: _onselectedchoice,
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
                    value: 0,
                    child: Container(
                      height: 30,
                      width: 106,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Image.asset("assets/images/Paper Download.png"),
                          Image.asset(
                            "assets/images/Close Square.png",
                            height: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Cancel Order",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
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
        body: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification overscroll) {
              overscroll.disallowIndicator();
              return size[0];
            },
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10, right: 10, left: 10),
                      child: Card(
                        //  color: Colors.,
                        elevation: 2,
                        shadowColor: Colors.grey.shade300,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          // side: BorderSide(width: 1, color: Colors.grey.shade200)
                        ),

                        child: Container(
                          height: 140,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 15, bottom: 15, left: 15),
                                child: Image.asset(widget.image),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 12, top: 20, right: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.name,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 14),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 11, bottom: 10),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(right: 6),
                                            child: CircleAvatar(
                                              backgroundColor: widget.color,
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
                                            widget.size_,
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
                                            widget.qty,
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
                                        height: 25,
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
                                          right: 10, top: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "${widget.price} ",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
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
                    ),
                    horizontalStepper(),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Center(
                        child: Text(
                          "Pocket in Delivery",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12, top: 30),
                      child: Text(
                        "Order Status Details",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    verticalStepper(),
                  ]),
            )));
  }

  Widget horizontalStepper() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 32, right: 32),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/box.png",
                  height: 30,
                  alignment: Alignment.center,
                ),
                Image.asset(
                  "assets/images/truck.png",
                  height: 30,
                  alignment: Alignment.center,
                ),
                Image.asset(
                  "assets/images/man.png",
                  height: 30,
                  alignment: Alignment.center,
                ),
                Image.asset(
                  "assets/images/open_box.png",
                  height: 30,
                  alignment: Alignment.center,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 34, right: 34),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/Vector.png",
                  height: 20,
                  alignment: Alignment.center,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 7.5, right: 7.5),
                  child: DottedLine(
                      direction: Axis.horizontal,
                      lineLength: 55,
                      dashLength: 4,
                      dashColor: Appcolors.primarycolor),
                ),
                Image.asset(
                  "assets/images/Vector.png",
                  height: 20,
                  alignment: Alignment.center,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 7.5, right: 7.5),
                  child: DottedLine(
                      direction: Axis.horizontal,
                      lineLength: 55,
                      dashLength: 4,
                      dashColor: Appcolors.primarycolor),
                ),
                Image.asset(
                  "assets/images/greyVector.png",
                  height: 20,
                  alignment: Alignment.center,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 7.5, right: 7.5),
                  child: DottedLine(
                      direction: Axis.horizontal,
                      lineLength: 55,
                      dashLength: 4,
                      dashColor: Colors.grey),
                ),
                Image.asset(
                  "assets/images/greyVector.png",
                  height: 20,
                  alignment: Alignment.center,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget verticalStepper() {
    return Padding(
        padding:
            const EdgeInsets.only(top: 20, left: 12, right: 12, bottom: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Image.asset(
              "assets/images/circle.png",
              height: 28,
              alignment: Alignment.center,
            ),
            orderStatus(
                title: "Order in Transit - Dec 17",
                subtitle: "32 Manchester Ave Ringgold, GA 30736",
                time: "15:20 PM",
                Width: width * 0.25)
          ]),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 7.5),
            child: DottedLine(
                direction: Axis.vertical,
                lineLength: 30,
                dashLength: 4,
                dashColor: Colors.grey.shade400),
          ),
          Row(
            children: [
              Image.asset(
                "assets/images/circle.png",
                height: 28,
                alignment: Alignment.center,
              ),
              orderStatus(
                  title: "Order ... Custom Part - Dec 16",
                  subtitle: "4 Evergreen Street Loke Zurich. IL 60047",
                  time: "14:40 AM",
                  Width: width * 0.145555)
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 7.5),
            child: DottedLine(
                direction: Axis.vertical,
                lineLength: 30,
                dashLength: 4,
                dashColor: Colors.grey.shade400),
          ),
          Row(
            children: [
              Image.asset(
                "assets/images/circle.png",
                height: 28,
                alignment: Alignment.center,
              ),
              orderStatus(
                title: "Order are ... Shipped - Dec 15",
                subtitle: "9177 Hillcrest Street Wheeling. WV 26003",
                time: "11:30 AM",
                Width: width * 0.15,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 7.5),
            child: DottedLine(
                direction: Axis.vertical,
                lineLength: 30,
                dashLength: 4,
                dashColor: Colors.grey.shade400),
          ),
          Row(
            children: [
              Image.asset(
                "assets/images/circle.png",
                height: 28,
                alignment: Alignment.center,
              ),
              orderStatus(
                title: "Order is in Packing - Dec 15",
                subtitle: "891 Glen Ridge St.Ganesville. VA 20155",
                time: "10:25 PM",
                Width: width * 0.18,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 7.5),
            child: DottedLine(
                direction: Axis.vertical,
                lineLength: 30,
                dashLength: 4,
                dashColor: Colors.grey.shade400),
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                "assets/images/circle.png",
                height: 28,
                alignment: Alignment.center,
              ),
              orderStatus(
                title: "Verified Payments - Dec 15",
                subtitle: "55 Summerhouse Dr.Apopka. FL 32703",
                time: "10:24 AM",
                Width: width * 0.19,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 7.5),
            child: DottedLine(
                direction: Axis.vertical,
                lineLength: 30,
                dashLength: 4,
                dashColor: Colors.grey.shade400),
          ),
          Row(
            children: [
              Image.asset(
                "assets/images/circle.png",
                height: 28,
                alignment: Alignment.center,
              ),
              orderStatus(
                  title: "Order ... Custom Part - Dec 16",
                  subtitle: "4 Evergreen Street Loke Zurich. IL 60047",
                  time: "14:40 AM",
                  Width: width * 0.14555)
            ],
          ),
        ]));
  }

  Widget orderStatus({
    required String title,
    required String subtitle,
    required String time,
    required Width,
  }) {
    return Padding(
        padding: const EdgeInsets.only(left: 12, right: 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8, top: 5),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: Width,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      time,
                      style: TextStyle(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.bold,
                          fontSize: 10),
                      // textAlign: TextAlign.end,
                    ),
                  )
                ],
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 11,
                  color: Colors.grey),
            ),
          ],
        ));
  }
}
