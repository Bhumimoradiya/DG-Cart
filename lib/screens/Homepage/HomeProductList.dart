import 'package:flutter/material.dart';

class HomeProductList extends StatefulWidget {
  const HomeProductList({super.key});

  @override
  State<HomeProductList> createState() => _HomeProductListState();
}

class _HomeProductListState extends State<HomeProductList> {
  List listCategories = [
    "assets/images/seater-sofa 1.png",
    "assets/images/bed 1.png",
    "assets/images/chair 1.png",
    "assets/images/wardrobe 1.png",
    "assets/images/pngwing.png",
  ];
  List listCategorieName = ["Sofa", "Beds", "Chairs", "Wardrobe", "Wing"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 8),
      child: SizedBox(
        height: 120,
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowIndicator();
            return listCategorieName[0];
          },
          child: ListView.builder(
              itemCount: listCategories.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 4,
                                  offset: Offset(0, 5),
                                  spreadRadius: 1),
                              BoxShadow(
                                  color: Colors.black26, offset: Offset(0, 0)),
                              BoxShadow(
                                  color: Colors.black26, offset: Offset(0, 0))
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image(
                            image: AssetImage(listCategories[index]),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 15),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            listCategorieName[index],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
