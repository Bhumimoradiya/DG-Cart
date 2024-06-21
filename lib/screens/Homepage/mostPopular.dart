import 'package:digi_cart_furniture/component/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../component/appcolors.dart';
import 'DetailPage.dart';

class MostPopular extends StatefulWidget {
  const MostPopular({super.key});

  @override
  State<MostPopular> createState() => _MostPopularState();
}

class _MostPopularState extends State<MostPopular> {
  List listName = ["All", "Sofa", "Chair", "Slipper Sofa", "Bed"];
  var size, height, width;
  List productListimage = [
    "assets/images/Rectangle 1234.png",
    "assets/images/aa.png",
    "assets/images/Rectangle 1234a.png",
    "assets/images/Rectangle 1234azs.png",
    "assets/images/Rectangle 1234az.png",
    "assets/images/Rectangle 1234azsX.png",
  ];
  List productListname = [
    "Wingback couch with part",
    "Metal desk with laptop chair",
    "High Quality bed",
    "Wardrobe renovation",
    "Empty table chair",
    "Luxury bedroom bed"
  ];
  List productListprice = [
    "₹2999",
    "₹1999",
    "₹2999",
    "₹1999",
    "₹1999",
    "₹2999",
    "₹1999"
  ];
  List productListHideprice = [
    "₹1199",
    "₹2499",
    "₹1199",
    "₹2499",
    "₹1199",
    "₹2499"
  ];
  List productDiscount = [
    "20% off",
    "25% off",
    "20% off",
    "25% off",
    "20% off",
    "25% off"
  ];

  List currentindex = [false, false, false, false, false, false];
  int productindex = 0;
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
            "Most Popular",
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
            return currentindex[0];
          },
          child: Padding(
            padding:
                const EdgeInsets.only(left: 2, right: 2, top: 10, bottom: 5),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 5, right: 5, top: 10, bottom: 10),
                  child: SizedBox(
                    height: 35,
                    width: width * 2,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: listName.length,
                        itemBuilder: ((BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 5, right: 5, bottom: 5),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: index == productindex
                                        ? Appcolors.primarycolor
                                        : Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18))),
                                onPressed: () {
                                  setState(() {
                                    productindex = index;
                                  });
                                },
                                child: Text(
                                  listName[index],
                                  style: TextStyle(
                                      color: index == productindex
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: FontWeight.bold),
                                )),
                          );
                        })),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: productListimage.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.69, crossAxisCount: 2),
                      itemBuilder: ((context, index) {
                        return GestureDetector(
                          onTap: () {
                            nextscreen(
                                context,
                                DetailPage(
                                    discount: "20% off",
                                    hideprice: productListHideprice[index],
                                    name: productListname[index],
                                    price: productListprice[index],
                                    rate: "4.5",
                                    favourite: currentindex[index],
                                    id:0,
                                    //  product: Product(
                                                // id: 101,
                                                // name:productListname[index],
                                                // price: productListprice[index]),
                                    quantity: 1,
                                    sliderpic: [
                                      productListimage[index],
                                      productListimage[index],
                                      productListimage[index],
                                      productListimage[index],
                                      productListimage[index],
                                    ]));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.only(top: 1),
                                        child: Image(
                                          image: AssetImage(
                                              productListimage[index]),
                                          // height: height * 0.25,
                                          width: 180,
                                          fit: BoxFit.cover,
                                        )),
                                    Positioned(
                                      top: 1,
                                      // right: 130,
                                      // right: width * 0.35,
                                      child: Container(
                                        height: 18,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(15),
                                                bottomRight:
                                                    Radius.circular(15)),
                                            color: Appcolors.primarycolor),
                                        child: Center(
                                          child: Text(
                                            productDiscount[index],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 11),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        top: 10,
                                        // left: width * 0.34,
                                        // right: width * 0.01,
                                        right: 1,
                                        left: 130,
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                // if (currentindex == index) {
                                                //   currentindex = -1;
                                                // } else {
                                                //   currentindex = index;
                                                // }
                                                currentindex[index] =
                                                    !currentindex[index];
                                              });
                                            },
                                            child: CircleAvatar(
                                              backgroundColor: Colors.white,
                                              minRadius: 15,
                                              child: Image(
                                                image: AssetImage(
                                                  "assets/images/Heart 2.png",
                                                ),
                                                color: currentindex[index]
                                                    ? Appcolors.primarycolor
                                                    : Colors.grey,
                                                height: 13,
                                              ),
                                            ),
                                          ),
                                        ))
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, top: 5),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      productListname[index],
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5, right: 3),
                                        child: RatingBar(
                                            itemSize: 19,
                                            glow: false,
                                            initialRating: 0,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 1,
                                            ratingWidget: RatingWidget(
                                                full: const Icon(Icons.star,
                                                    color:
                                                        Appcolors.primarycolor),
                                                half: const Icon(
                                                  Icons.star_half,
                                                  color: Appcolors.primarycolor,
                                                ),
                                                empty: const Icon(
                                                  Icons.star_outline,
                                                  color: Appcolors.primarycolor,
                                                )),
                                            onRatingUpdate: (value) {
                                              setState(() {});
                                            }),
                                      ),
                                      Text(
                                        "4.5  (221)",
                                        style: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: 11),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 6),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 7, right: 5),
                                        child: Text(
                                          productListprice[index],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(productListHideprice[index],
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey.shade500,
                                              decoration:
                                                  TextDecoration.lineThrough))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      })),
                ),
              ],
            ),
          ),
        ));
  }
}
