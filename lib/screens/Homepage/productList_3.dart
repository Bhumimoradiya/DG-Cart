import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class productList_3 extends StatefulWidget {
  const productList_3({super.key});

  @override
  State<productList_3> createState() => _productList_3State();
}

class _productList_3State extends State<productList_3> {
  var size, height, width;
  List productListimage = [
    "assets/images/pngwing.png",
    "assets/images/pngwingAX.png",
    "assets/images/pngwingASX.png",
    "assets/images/pngimg 1.png",
    "assets/images/pngwing.png",
  ];
  List productListName = [
    "Royal Chair",
    "Wooden Sofa",
    "Signal Sofa",
    "Solid Bed",
    "Royal Chair"
  ];
  List productListprice = ["₹999", "₹6999", "₹499", "₹9999", "₹999"];
  List<Color> productListColor = [
    Colors.grey.shade100,
    Color.fromARGB(221, 218, 232, 250),
    Color.fromARGB(255, 252, 232, 202),
    Color.fromARGB(255, 248, 212, 224),
    // Color.fromARGB(221, 218, 232, 250),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection("chairList").snapshots(),
            builder: (context, snapshot) {
              return Padding(
                padding: const EdgeInsets.only(left: 10, right: 7),
                child: SizedBox(
                  height: 128,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 0, right: 3),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Positioned(
                                    top: 6,
                                    child: Container(
                                      height: 80,
                                      width: 120,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: productListColor[index]),
                                    ),
                                  ),
                                  Positioned(
                                      // left: 5,
                                      // top: 10,
                                      child: Center(
                                    child: Image(
                                      image: NetworkImage(
                                        snapshot.data!.docs[index]["image"]
                                            .toString(),
                                      ),
                                      height: 90,
                                      width: 120,
                                    ),
                                  )),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 1),
                                child: Text(
                                  snapshot.data!.docs[index]["name"].toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 0),
                                child: Text(
                                  "Under ${snapshot.data!.docs[index]["currency"].toString()} ${snapshot.data!.docs[index]["price"].toString()}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                ),
              );
            }),
      ],
    );
  }
}
