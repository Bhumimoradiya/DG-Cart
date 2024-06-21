import 'package:digi_cart_furniture/screens/viewAll.dart';
import 'package:flutter/material.dart';

import '../../component/appcolors.dart';
import 'Home_widget.dart';

class productList_5 extends StatefulWidget {
  const productList_5({super.key});

  @override
  State<productList_5> createState() => _productList_5State();
}

class _productList_5State extends State<productList_5> {
  var size, height, width;
  List productListimage = [
    "assets/images/istockphoto-1285148665-612x612 1.png",
    "assets/images/istockphoto-1287372078-612x612 1.png",
    "assets/images/istockphoto-1253531584-612x612 1.png"
  ];
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Stack(
      children: [
        Container(
          height: 120,
          width: width,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.orange,
            Appcolors.primarycolor,
            Colors.yellow.shade600
          ])),
        ),
        // ProductNameViewall(context,
        //     page: viewAll(), name: "Deal of Day", color: Colors.white),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8),
          child: ProductNameViewall(context,
              page: viewAll(), name: "Top Categories", color: Colors.black),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: SizedBox(
              height: 210,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productListimage.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 8, right: 8, top: 40),
                          child: Image(
                            image: AssetImage(productListimage[index]),
                            height: 150,
                          ),
                        ),
                        Positioned(
                          top: height * 0.214,
                          left: 10,
                          child: Container(
                            height: 20,
                            width: 115,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.6),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(9),
                                    bottomRight: Radius.circular(9))),
                            child: Center(
                              child: Text(
                                "Under ₹1999",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  })),
        )
      ],
    );
  }
}
