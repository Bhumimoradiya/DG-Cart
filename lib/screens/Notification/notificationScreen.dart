import 'package:digi_cart_furniture/component/appcolors.dart';
import 'package:flutter/material.dart';

import 'cardWidget.dart';

class notificationScreen extends StatefulWidget {
  const notificationScreen({super.key});

  @override
  State<notificationScreen> createState() => _notificationScreenState();
}

class _notificationScreenState extends State<notificationScreen> {
  var size, height, width;
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
            return size;
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 20),
                  child: Text(
                    "Today",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                cardWidget(
                  image: "assets/images/Discount.png",
                  subTitle: "Special promotion only valid today",
                  title: "30% Special Discount!",
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 20),
                  child: Text(
                    "Yesterday",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                cardWidget(
                    image: "assets/images/Wallet.png",
                    title: "Top Up E-Wallet Successful!",
                    subTitle: "You have to top up your e-wallet"),
                cardWidget(
                    image: "assets/images/Location.png",
                    title: "New Services Available!",
                    subTitle: "Now you can track orders in real time"),
                cardWidget(
                    image:
                        "assets/images/Category=Credit Card, Component=Additional Icons.png",
                    title: "Credit Card Connected!",
                    subTitle: "Credit Card has been linked!"),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 20),
                  child: Text(
                    "December 22, 2024",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                cardWidget(
                    image: "assets/images/ProfileWhite.png",
                    title: "Account Setup Successful!",
                    subTitle: "Your account has been created!"),
                SizedBox(
                  height: 60,
                )
              ],
            ),
          ),
        ));
  }
}
