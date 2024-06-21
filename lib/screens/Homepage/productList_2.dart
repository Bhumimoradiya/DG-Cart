import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class productList_2 extends StatefulWidget {
  const productList_2({super.key});

  @override
  State<productList_2> createState() => _productList_2State();
}

class _productList_2State extends State<productList_2> {
  var size, height, width;

  List productListimage = [
    "assets/images/istockphoto-1416326619-612x612 1.png",
    // "assets/images/xa.png",
    "assets/images/Rectangle 1234az.png",
    "assets/images/istockphoto-956310980-612x612 1.png",
    "assets/images/Rectangle 1234azs.png"
  ];
  List productListName = [
    "Century Modern Living\nRoom Interior Design",
    "Sofa Living Room Live\nWith Space",
    "Century Modern Living\nRoom Interior Design",
    "Sofa Living Room Live\nWith Space"
  ];
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Column(
      children: [
        StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("topcategories")
                .snapshots(),
            builder: (context, snapshot) {
              return SizedBox(
                height: 230,
                child: snapshot.connectionState == ConnectionState.active
                    ? snapshot.hasData
                        ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data?.docs.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: SizedBox(
                                  width: 180,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          children: [
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 1),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(15),
                                                              topRight: Radius
                                                                  .circular(
                                                                      15))),
                                                  child: Image(
                                                    image: NetworkImage(snapshot
                                                        .data!
                                                        .docs[index]["image"]
                                                        .toString()),
                                                    // height: 100,
                                                    width: 180,
                                                    fit: BoxFit.cover,
                                                  ),
                                                )),
                                            Positioned(
                                              top: 13,
                                              // right: 130,
                                              right: width * 0.17,
                                              child: Container(
                                                height: 24,
                                                width: 68,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    color: Colors.white),
                                                child: Center(
                                                  child: Text(
                                                    "${snapshot.data!.docs[index]["discount"].toString()}% off",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 11),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15, top: 5),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              snapshot.data!.docs[index]["name"]
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            })
                        : snapshot.hasError
                            ? Center(
                                child: Text("${snapshot.hasError.toString()}"),
                              )
                            : Center(child: CircularProgressIndicator())
                    : Center(child: CircularProgressIndicator()),
              );
            }),
      ],
    );
  }
}
