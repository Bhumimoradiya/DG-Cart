import 'package:flutter/material.dart';

import '../../../component/appcolors.dart';

class CategoriesFilter extends StatefulWidget {
  const CategoriesFilter({super.key});

  @override
  State<CategoriesFilter> createState() => _CategoriesFilterState();
}

class _CategoriesFilterState extends State<CategoriesFilter> {
  var size, height, width;
  int wrapButtonIndex = 0;
  List ButtonList = [
    "All",
    "Sofas",
    "Chairs",
    "Bed",
    "Slipper Sofa",
    "Poufs",
    "Tables",
    "Armchairs",
    "Sleeping",
    "Altek",
    "Storage Systems",
    "Children's Rooms",
    "Kids furniture",
    "Sitting Ball",
  ];
  dynamic page = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  void _changeFocusedIndex(int index) {
    setState(() {
      wrapButtonIndex = index;
    });
  }

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
            "Categories",
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
        body: Padding(
          padding: const EdgeInsets.only(top: 20, left: 13, right: 13),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: WrapButton(),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)), backgroundColor: Appcolors.primarycolor,
                  fixedSize: Size(300, 50)),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Center(
                child: Text(
                  "Apply",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              )),
        ));
  }

  Widget WrapButton() {
    return Wrap(
        alignment: WrapAlignment.start,
        direction: Axis.horizontal,
        spacing: 15,
        runSpacing: 0,
        children: <Widget>[
          ...List.generate(ButtonList.length, (index) {
            return ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: page[index] ? Appcolors.primarycolor : Colors.white,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      side: BorderSide(
                          color: page[index]
                              ? Appcolors.primarycolor
                              : Colors.grey.shade300,
                          width: 1),
                    )),
                onPressed: () {
               
                  if (index >= 1) {
                    if (page[0] == true) {
                      return;
                    } else {
                      page[index] = !page[index];
                      setState(() {});
                    }
                  } else {
                    if (page[0] == page[index]) {
                      page[1] = false;
                    }
                    if (page[0] == page[index]) {
                      page[2] = false;
                    }
                    if (page[0] == page[index]) {
                      page[3] = false;
                    }
                    if (page[0] == page[index]) {
                      page[4] = false;
                    }
                    if (page[0] == page[index]) {
                      page[5] = false;
                    }
                    if (page[0] == page[index]) {
                      page[6] = false;
                    }
                    if (page[0] == page[index]) {
                      page[7] = false;
                    }
                    if (page[0] == page[index]) {
                      page[8] = false;
                    }
                    if (page[0] == page[index]) {
                      page[9] = false;
                    }
                    if (page[0] == page[index]) {
                      page[10] = false;
                    }
                    if (page[0] == page[index]) {
                      page[11] = false;
                    }
                    if (page[0] == page[index]) {
                      page[12] = false;
                    }
                    if (page[0] == page[index]) {
                      page[13] = false;
                    }
                  
                    page[index] = !page[index];
                    setState(() {});
                  }
                  // _changeFocusedIndex(index);
                  // setState(() {
                  //   WrapButtonIndex = index;
                  // })
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                  child: Text(
                    ButtonList[index],
                    style: TextStyle(
                        color:
                            page[index] ? Colors.white : Appcolors.primarycolor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ));
          }),
        ]);
  }
}
