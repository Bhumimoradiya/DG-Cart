import 'package:digi_cart_furniture/component/appcolors.dart';
import 'package:digi_cart_furniture/screens/Cart/cartdata.dart';
import 'package:digi_cart_furniture/screens/Profile/profile.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'Homepage/homepage.dart';
import 'Categories/categories.dart';
import 'MyOrders/orders.dart';

// ignore: must_be_immutable
class bottomNavigationBar extends StatefulWidget {
  bottomNavigationBar({super.key, required this.myIndex});
  int myIndex;
  @override
  State<bottomNavigationBar> createState() => _bottomNavigationBarState();
}

class _bottomNavigationBarState extends State<bottomNavigationBar> {
  int myIndex = 0;

  void changeTab(int index) {
    setState(() {
      // widget.myIndex == 4 ? myIndex:
      myIndex = index;
      widget.myIndex = index;
      // myIndex++;
    });
  }

  FirebaseStorage storage = FirebaseStorage.instance;
  Future<String> getDownloadImage() async {
    final imagePath = await storage.ref('profile.jpg').getDownloadURL();
    return imagePath;
  }

  // final filepath = "gs://dg-furniture-424b2.appspot.com/profile.jpg";
  @override
  Widget build(BuildContext context) {
    final pages = [Homepage(), CartScreen(), categories(), Orders(), Profile()];
    return Scaffold(
      // backgroundColor: Colors.white,
      body: IndexedStack(
        index: widget.myIndex,
        children: pages,
      ),

      // drawer: drawer(),
      bottomNavigationBar: FutureBuilder(
          future: getDownloadImage(),
          builder: (context, snapshot) {
            return BottomNavigationBar(
                // key: scaffoldState,
                currentIndex: myIndex,
                onTap: (index) => changeTab(index),
                type: BottomNavigationBarType.fixed,
                showUnselectedLabels: true,
                selectedItemColor: Appcolors.primarycolor,
                unselectedItemColor: Appcolors.primarycolor,
                selectedFontSize: 13,
                unselectedFontSize: 12,
                iconSize: 28,
                items: [
                  BottomNavigationBarItem(
                      icon: widget.myIndex == 0
                          ? ImageIcon(
                              AssetImage("assets/images/Home_sharp.png"))
                          : ImageIcon(AssetImage("assets/images/Home.png")),
                      label: "Home"),
                  BottomNavigationBarItem(
                    icon: widget.myIndex == 1
                        ? Image.asset(
                            "assets/images/Bag_sharp.png",
                            height: 30,
                          )
                        : ImageIcon(AssetImage("assets/images/Bag.png")),
                    label: "Cart",
                  ),
                  BottomNavigationBarItem(
                      icon: widget.myIndex == 2
                          ? ImageIcon(
                              AssetImage("assets/images/Category_sharp.png"))
                          : ImageIcon(AssetImage("assets/images/Category.png")),
                      label: "Categories"),
                  BottomNavigationBarItem(
                      icon: widget.myIndex == 3
                          ? ImageIcon(AssetImage("assets/images/Buy_sharp.png"))
                          : ImageIcon(AssetImage("assets/images/Buy.png")),
                      label: "Orders"),
                  BottomNavigationBarItem(
                      icon: snapshot.connectionState == ConnectionState.waiting
                          ? CircleAvatar(
                              maxRadius: 14,
                              backgroundColor: Appcolors.primarycolor,
                              // child: CircleAvatar(
                              //   maxRadius: 12,
                              //   // backgroundColor: Colors.white,
                              //   // backgroundImage:
                              //   // // snapshot.connectionState==ConnectionState.waiting?AssetImage(assetName):
                              //   // NetworkImage(
                              //   //   "${snapshot.data!}",
                              //   // )
                              // ),
                            )
                          : CircleAvatar(
                              maxRadius: 14,
                              backgroundColor: widget.myIndex == 4
                                  ? Appcolors.primarycolor
                                  : Colors.transparent,
                              child: CircleAvatar(
                                  maxRadius: widget.myIndex == 4 ? 12 : 14,
                                  backgroundColor: widget.myIndex == 4
                                      ? Colors.white
                                      : Appcolors.primarycolor,
                                  backgroundImage:
                                      // snapshot.connectionState==ConnectionState.waiting?AssetImage(assetName):
                                      NetworkImage(
                                    "${snapshot.data!}",
                                  )),
                            ),
                      // icon: Image.asset(
                      //   "assets/images/Group 459.png",
                      //   height: 30,
                      // ),
                      // icon: myIndex == 4
                      //     ? Icon(Icons.person)
                      //     : Icon(Icons.person_2_outlined),
                      label: "Profile"),
                ]);
          }),
    );
  }
}
