import 'package:digi_cart_furniture/component/appcolors.dart';
import 'package:digi_cart_furniture/component/widget.dart';
import 'package:flutter/material.dart';
// import 'package:custom_switch/custom_switch.dart';
import 'package:flutter_switch/flutter_switch.dart';

class notification extends StatefulWidget {
  const notification({super.key});

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  // bool status = false;
  List notification = [
    "Sound",
    "Vibrate",
    "Special Offers",
    "Promo & Discount",
    "Payments",
    "Cashback",
    "App Updates",
    "New Service Available",
    "New Tips Available"
  ];
  late List<bool> status;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    status = List<bool>.filled(notification.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          // elevation: 0,
          centerTitle: true,
          title: Text(
            "Notification",
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
            return size[0];
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Column(
              children: [
                NotificationWidget(),
              ],
            ),
          ),
        ));
  }

  Widget NotificationWidget() {
    return SizedBox(
      height: height * 0.7,
      child: ListView.builder(
          itemCount: notification.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(
                  top: 20, left: 15, right: 15, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    notification[index],
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54),
                  ),
                  FlutterSwitch(
                    inactiveColor: Colors.grey.shade200,
                    height: 23,
                    width: 42.0,
                    padding: 2,
                    toggleSize: 20.0,
                    borderRadius: 12.0,
                    activeColor: Appcolors.primarycolor,
                    value: status[index],
                    onToggle: (value) {
                      setState(() {
                        status[index] = !status[index];
                      });
                    },
                  ),
                  // CustomSwitch(
                  //   activeColor: Appcolors.primarycolor,
                  //   value: status,
                  //   onChanged: (value) {
                  //     // print("VALUE : $value");
                  //     setState(() {
                  //       status = value;
                  //     });
                  //   },
                  // ),
                  // SizedBox(
                  //   height: 12.0,
                  // ),
                  // Text('Value : $status', style: TextStyle(
                  //   color: Colors.black,
                  //   fontSize: 20.0
                  // ),)
                ],
              ),
            );
          }),
    );
  }
}
