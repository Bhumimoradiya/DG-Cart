import 'package:digi_cart_furniture/component/appcolors.dart';
import 'package:flutter/material.dart';

class ChildrenRooms extends StatefulWidget {
  const ChildrenRooms({super.key});

  @override
  State<ChildrenRooms> createState() => _ChildrenRoomsState();
}

class _ChildrenRoomsState extends State<ChildrenRooms> {
  List productListimage = [
    "assets/images/image 44.png",
    "assets/images/image 45.png",
    "assets/images/image 46.png",
    "assets/images/image 47.png",
    "assets/images/image 48.png",
    "assets/images/image 49.png",
    "assets/images/image 50.png",
    "assets/images/image 51.png",
    "assets/images/image 52.png",
    "assets/images/image 53.png",
    "assets/images/image 54.png",
  ];
  List productListname = [
    "Easy chairs",
    "Armchairs",
    "Chaise lounges",
    "Cushions",
    "Sitting Ball",
    "Poufs",
    "Footstools",
    "Kids sofas",
    "Day beds",
    "Altek",
    "Donut Sofa",
  ];
  var size, height, width;

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
            "Children's Rooms",
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
        body:NotificationListener<OverscrollIndicatorNotification>(
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
                  return Padding(
                    padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                width: 1,
                                color: Colors.grey.shade200,
                              )),
                          child: ClipRRect(
                            // height: 100,
                            // width: 100,
                            //   decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            //       border: Border.all(
                            //         width: 1,
                            //         color: Colors.grey.shade200,
                            //       )),
                            child: Image(
                              image: AssetImage(
                                productListimage[index],
                              ),
                              width: 180,

                              fit: BoxFit.cover,
                              // height: height * 0.5,
                              // width: 90,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            productListname[index],
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  );
                })),
          ),
        )));
  }
}
