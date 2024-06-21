import 'package:digi_cart_furniture/component/widget.dart';
import 'package:digi_cart_furniture/screens/Cart/PaymentMethods.dart';
import 'package:digi_cart_furniture/screens/Cart/addNewAddress.dart';
import 'package:flutter/material.dart';

import '../../component/appcolors.dart';

class ShippingAddress extends StatefulWidget {
  const ShippingAddress({super.key, this.page});
  final page;
  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
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
            "Shipping Address",
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
            child: Column(children: [
          GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = 1;
              });
            },
            child: Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 15, bottom: 10),
                child: Card(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Colors.grey.shade200),
                        borderRadius: BorderRadius.circular(30)),
                    shadowColor: Colors.transparent,
                    // color: Color.fromARGB(95, 238, 238, 238),
                    child: Container(
                        height: 100,
                        width: width,
                        child: Padding(
                            padding: const EdgeInsets.only(
                                left: 0, top: 15, right: 0, bottom: 15),
                            child: ListTile(
                              title: Row(
                                children: [
                                  Text(
                                    "Home",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 17),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Container(
                                      height: 25,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade100,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Center(
                                        child: Text(
                                          "Default",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    "61480 Sunbrook Park, PC 5679",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12),
                                  )),
                              leading: Container(
                                height: 55,
                                width: 55,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    shape: BoxShape.circle),
                                child: Padding(
                                  padding: const EdgeInsets.all(7),
                                  child: CircleAvatar(
                                    minRadius: 25,
                                    backgroundColor: currentIndex == 1
                                        ? Appcolors.primarycolor
                                        : Colors.black,
                                    child: Image.asset(
                                      "assets/images/LocationZA.png",
                                      height: 25,
                                    ),
                                  ),
                                ),
                              ),
                              trailing: Radio<int>(
                                fillColor: MaterialStateColor.resolveWith(
                                    (states) => currentIndex == 1
                                        ? Appcolors.primarycolor
                                        : Colors.grey.shade300),
                                value: 1,
                                groupValue: currentIndex,
                                onChanged: (int? value) {
                                  setState(() {
                                    currentIndex = value!;
                                  });
                                },
                              ),
                            ))))),
          ),
          cardWidget(
              name: "Office",
              Address: "6993 Meadow Valley Terra, PC 3637",
              currentindex: 2),
          cardWidget(
              name: "Apartment",
              Address: "21833 Clycle Gallagher, PC 3637",
              currentindex: 3),
          cardWidget(
              name: "Parent's House",
              Address: "5259 Blue Bill Park, PC 3637",
              currentindex: 4),
          Padding(
            padding:
                const EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 20),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shadowColor: Colors.transparent, backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        side:
                            BorderSide(width: 1, color: Appcolors.primarycolor),
                        borderRadius: BorderRadius.circular(25)),
                    minimumSize: Size(300, 55)),
                onPressed: () {
                  nextscreen(context, AddNewAddress());
                },
                child: Center(
                  child: Text(
                    "Add New Address",
                    style: TextStyle(
                        color: Appcolors.primarycolor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                )),
          )
        ])),
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
                child: elevatedButton(context, "Apply", PaymentMethods()),
              ))
        ]));
  }

  Widget cardWidget({
    required String name,
    required String Address,
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
              const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 10),
          child: Card(
              shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(30)),
              shadowColor: Colors.transparent,
              // color: Color.fromARGB(95, 238, 238, 238),
              child: Container(
                  height: 100,
                  width: width,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          left: 0, top: 15, right: 0, bottom: 10),
                      child: ListTile(
                        title: Text(
                          name,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 17),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            Address,
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          ),
                        ),
                        leading: Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              shape: BoxShape.circle),
                          child: Padding(
                            padding: const EdgeInsets.all(7),
                            child: CircleAvatar(
                              minRadius: 25,
                              backgroundColor: currentIndex == currentindex
                                  ? Appcolors.primarycolor
                                  : Colors.black,
                              child: Image.asset(
                                "assets/images/LocationZA.png",
                                height: 25,
                              ),
                            ),
                          ),
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
