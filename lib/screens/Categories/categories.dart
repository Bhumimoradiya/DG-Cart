import 'package:digi_cart_furniture/component/appcolors.dart';
import 'package:digi_cart_furniture/component/widget.dart';
import 'package:digi_cart_furniture/screens/Categories/Tables.dart';
import 'package:digi_cart_furniture/screens/Categories/armchairs.dart';
import 'package:digi_cart_furniture/screens/Categories/chairs.dart';
import 'package:digi_cart_furniture/screens/Categories/childrenRoom.dart';
import 'package:digi_cart_furniture/screens/Categories/kidsFurniture.dart';
import 'package:digi_cart_furniture/screens/Categories/sleeping.dart';
import 'package:digi_cart_furniture/screens/Categories/sofas.dart';
import 'package:digi_cart_furniture/screens/Categories/storage_system.dart';
import 'package:flutter/material.dart';

class categories extends StatefulWidget {
  const categories({super.key});

  @override
  State<categories> createState() => _categoriesState();
}

class _categoriesState extends State<categories> {
  List productListimage = [
    "assets/images/image 36.png",
    "assets/images/image 37.png",
    "assets/images/image 38.png",
    "assets/images/image 41.png",
    "assets/images/image 40.png",
    "assets/images/image 39.png",
    "assets/images/image 42.png",
    "assets/images/image 43.png",
  ];
  List productListname = [
    "Sofas",
    "Armchairs",
    "Tables",
    "Sleeping",
    "Storage Systems",
    "Chairs",
    "Children's Rooms",
    "Kids furniture"
  ];
  List pages = [
    Sofas(),
    Armchairs(),
    Tables(),
    Sleeping(),
    Storage_system(),
    Chairs(),
    ChildrenRooms(),
    KidsFurniture(),
  ];
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
            "Categories",
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          shadowColor: Colors.transparent,
        ),
        body: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification overscroll) {
              overscroll.disallowIndicator();
              return size[0];
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
              child: SizedBox(
                // height: 132,
                child: GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: productListimage.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.82, crossAxisCount: 3),
                    itemBuilder: ((context, index) {
                      return GestureDetector(
                        onTap: () {
                          nextscreen(context, pages[index]);
                        },
                        child: Padding(
                          padding:
                              const EdgeInsets.only(top: 10, left: 8, right: 8),
                          child: Column(
                            children: [
                              Image.asset(productListimage[index]),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  productListname[index],
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    })),
              ),
            )));
  }
}
