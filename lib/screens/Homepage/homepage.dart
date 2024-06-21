import 'dart:io';

import 'package:digi_cart_furniture/component/appcolors.dart';
import 'package:digi_cart_furniture/component/widget.dart';
import 'package:digi_cart_furniture/screens/WishList/wishlist.dart';
import 'package:digi_cart_furniture/screens/Notification/notificationScreen.dart';
import 'package:flutter/material.dart';
import 'HomeBody.dart';
import 'drawer.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('Do you want to exit'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                //<-- SEE HERE
                child: const Text(
                  'No',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Appcolors.primarycolor),
                ),
              ),
              TextButton(
                onPressed: () {
                  exit(0);
                }, // <-- SEE HERE
                child: const Text(
                  'Yes',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Appcolors.primarycolor),
                ),
              ),
            ],
          ),
        )) ??
        false;
  }

  List cindex = [0];
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        // backgroundColor: Colors.white,
        appBar: HomeAppbar(context),
        drawer: drawer(),
        body: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification overscroll) {
              overscroll.disallowIndicator();
              return cindex[0];
            },
            child: HomeBody()),
      ),
    );
  }

  PreferredSizeWidget HomeAppbar(context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Appcolors.primarycolor,
        shadowColor: Colors.transparent,
        title: Center(
          child: Image.asset(
            "assets/images/logo.png",
            height: height * 0.034,
          ),
        ),
        actions: [
          Row(
            children: [
              GestureDetector(
                  onTap: () {
                    nextscreen(context, notificationScreen());
                  },
                  child: Image(
                    image: AssetImage(
                      "assets/images/Notification Icon Group.png",
                    ),
                    height: height * 0.03,
                  )),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 10),
                child: GestureDetector(
                    onTap: () {
                      nextscreen(context, wishList());
                    },
                    child: Image(
                      image: AssetImage(
                        "assets/images/Heart.png",
                      ),
                      height: height * 0.03,
                    )),
              ),
            ],
          ),
        ]);
  }
}
