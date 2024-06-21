import 'package:flutter/material.dart';

class productList_4 extends StatefulWidget {
  const productList_4({super.key});

  @override
  State<productList_4> createState() => _productList_4State();
}

class _productList_4State extends State<productList_4> {
  var size, height, width;

  List productListimage = [
    "assets/images/Rectangle 1236.png",
    // "assets/images/Rectangle 1236ASD.png",
    "assets/images/image 41.png",
    "assets/images/image 42.png",
    "assets/images/Rectangle 1236.png",
  ];
  List discountValue = [
    " Up to 45% off",
    "Up to 55% off",
    "Up to 65% off",
    "Up to 55% off"
  ];
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return SizedBox(
      height: 202,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productListimage.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50)),
                            child: Image(
                              image: AssetImage(productListimage[index]),
                              // height: height * 0.25,
                              width: 180,
                              fit: BoxFit.cover,
                            ),
                          )),
                      Positioned(
                        // top: 13,
                        // right: 130,
                        right: width * 0.12,
                        child: Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Color.fromARGB(255, 23, 54, 35)),
                          child: Center(
                            child: Text(
                              discountValue[index],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
