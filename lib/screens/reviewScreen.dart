import 'package:flutter/material.dart';

import '../component/appcolors.dart';

class reviewScreen extends StatefulWidget {
  const reviewScreen({super.key});

  @override
  State<reviewScreen> createState() => _reviewScreenState();
}

class _reviewScreenState extends State<reviewScreen> {
  int productindex = 0;
  List listName = ["All", "5", "4", "3", "2", "1"];
  var size, height, width;
  List profile = [
    "assets/images/Ellipse.png",
    "assets/images/EllipseVSD.png",
    "assets/images/EllipsesaXD.png",
    "assets/images/Ellipsezx.png",
    "assets/images/EllipseXCV.png",
  ];
  List name = [
    "Darlene Robertson",
    "Jane Cooper",
    "Jenny Wilson",
    "Marvin McKinney",
    "Theresa Webb",
  ];
  List iconimg = [
    "assets/images/HeartA.png",
    "assets/images/HeartL.png",
    "assets/images/HeartA.png",
    "assets/images/HeartL.png",
    "assets/images/HeartL.png",
  ];
  List likes = ["729", "625", "578", "347", "283"];
  List comment = [
    "The item is very good, my son likes it very much and plays every day 💯💯💯",
    "The Seller is very fast in sending pocket, I just bought it and the item arrived in just 1 day!👍👍",
    "I just bought it and the stuff is really good! I highly recommend it!😁😁",
    "The item is very good, my son likes it very much and plays every day 💯💯💯",
    "The Seller is very fast in sending pocket, I just bought it and the item arrived in just 1 day!👍👍",
  ];
  List star = ["5", "4", "4", "5", "4"];
  List days = [
    "6 days ago",
    "6 days ago",
    "6 days ago",
    "6 weeks ago",
    "4 weeks ago"
  ];
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
            "Reviews",
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
              return size[0];
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8, top: 20),
                  child: SizedBox(
                    height: 45,
                    width: width * 1,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: listName.length,
                        itemBuilder: ((BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                star[index] = listName[index];
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 5, right: 5, bottom: 5),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: index == productindex
                                          ? Appcolors.primarycolor
                                          : Colors.white,
                                      maximumSize: Size(80, 75),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  onPressed: () {
                                    setState(() {
                                      productindex = index;
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 18,
                                        color: index == productindex
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        listName[index],
                                        style: TextStyle(
                                            color: index == productindex
                                                ? Colors.white
                                                : Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17),
                                      ),
                                    ],
                                  )),
                            ),
                          );
                        })),
                  ),
                ),
                SizedBox(
                  height: height * 0.79,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: profile.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.black,
                                        maxRadius: 30,
                                        child: Image.asset(profile[index]),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 15,
                                        ),
                                        child: Text(
                                          name[index],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ]),
                                    Expanded(
                                      flex: -1,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            // alignment: Alignment.topRight,
                                            backgroundColor: Colors.white,
                                            maximumSize: Size(70, 75),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12))),
                                        onPressed: () {
                                          // setState(() {
                                          //   productindex = index;
                                          // });
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Icon(
                                              Icons.star,
                                              size: 18,
                                              color: Colors.black,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              star[index],
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 17),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Text(
                                  comment[index],
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black54),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Row(
                                  children: [
                                    Image(
                                      image: AssetImage(
                                        iconimg[index],
                                      ),
                                      height: 25,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 20),
                                      child: Text(
                                        likes[index],
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 12),
                                      ),
                                    ),
                                    Text(
                                      days[index],
                                      style: TextStyle(
                                          color: Colors.grey.shade500,
                                          fontSize: 13),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                ),
              ],
            )));
  }
}
