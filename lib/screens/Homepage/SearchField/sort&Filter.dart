import 'package:digi_cart_furniture/component/appcolors.dart';
import 'package:digi_cart_furniture/component/widget.dart';
import 'package:digi_cart_furniture/screens/BottomNavigationBar.dart';
import 'package:digi_cart_furniture/screens/Homepage/SearchField/CategoriesFilter.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class Sort_Filter extends StatefulWidget {
  const Sort_Filter({super.key});

  @override
  State<Sort_Filter> createState() => _Sort_FilterState();
}

class _Sort_FilterState extends State<Sort_Filter> {
  var size, height, width;
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
  ];
  int multiClickCount = 0;
  int multiClickButtonIndex = -1;
  bool areAllButtonsTapped = false;
  int WrapButtonIndex = 0;

  int selectedContainerIndex = 0;

  void onContainerSelected(int index) {
    setState(() {
      selectedContainerIndex = index;
    });
  }

  List ButtonList = [
    "All",
    "Sofas",
    "Chairs",
    "Bed",
    "Slipper Sofa",
    "Poufs",
    "Tables",
    "Kids furniture",
    "Sitting Ball",
    // "Tables",
    // "Sleeping",
    // "Altek",
    // "Storage Systems",
    // "Children's Rooms",
    // "Kids furniture",
    // "Sitting Ball",
  ];
  void _changeFocusedIndex(int index) {
    setState(() {
      WrapButtonIndex = index;
    });
  }

  List ratingName = ["5", "4", "3", "2", "1"];

  int sortIndex = 0;
  int ratingIndex = 0;

  List listName = ["Popular", "Most Recent", "Price High", "Price Low"];
  double _startValue = 200.0;
  double _endValue = 800.0;
  // SfRangeValues values = SfRangeValues(1, 100);
  SfRangeValues values = SfRangeValues(100.0, 800.0);
  RangeLabels labels = RangeLabels('1', "1000");
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
          "Sort & Filter",
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Categories",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: WrapButton(),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
              ),
              child: Text(
                "Price Range",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SfRangeSlider(
              min: 50,
              max: 1000,
              // values: values,
              values: SfRangeValues(_startValue, _endValue),
              interval: 8,
              showTicks: false,
              showLabels: false,
              labelPlacement: LabelPlacement.betweenTicks,
              enableTooltip: true,
              activeColor: Appcolors.primarycolor,
              inactiveColor: Colors.grey.shade200,
              // tooltipShape: Theme(data: null,
              // child: null,),
              // showDividers: true,
              overlayShape: SfOverlayShape(),
              enableIntervalSelection: true,
              // shouldAlwaysShowTooltip: true,
              // labelPlacement: LabelPlacement.betweenTicks,
              edgeLabelPlacement: EdgeLabelPlacement.auto,

              minorTicksPerInterval: 10,
              onChanged: (SfRangeValues _values) {
                setState(() {
                  values = _values;
                  _startValue = values.start;
                  _endValue = values.end;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: Text(
                "Sort by",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SortBy(),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: Text(
                "Rating",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SizedBox(
                  height: 35,
                  width: width * 2,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: ratingName.length,
                      itemBuilder: ((BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 7, left: 7),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(25, 35), backgroundColor: index == ratingIndex
                                      ? Appcolors.primarycolor
                                      : Colors.white,
                                  shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                      side: BorderSide(
                                        width: 1,
                                        color: index == ratingIndex
                                            ? Appcolors.primarycolor
                                            : Colors.grey.shade300,
                                      ))),
                              onPressed: () {
                                setState(() {
                                  ratingIndex = index;
                                });
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 15,
                                    color: index == ratingIndex
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    ratingName[index],
                                    style: TextStyle(
                                        color: index == ratingIndex
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ),
                                ],
                              )),
                        );
                      }))),
            )
          ])),
      bottomNavigationBar: Container(
        // height: height * 0.11,
        height: 80,
        width: width,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shadowColor: Colors.transparent, backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                          side: BorderSide(
                              width: 1, color: Appcolors.primarycolor)),
                      minimumSize: Size(160, 50)),
                  onPressed: () {},
                  child: Text(
                    "Reset",
                    style: TextStyle(
                        color: Appcolors.primarycolor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shadowColor: Colors.transparent, backgroundColor: Appcolors.primarycolor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        minimumSize: Size(160, 50)),
                    onPressed: () {
                      nextscreen(context, bottomNavigationBar(myIndex: 0,));
                    },
                    child: Text(
                      "Apply",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget SortBy() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8, top: 20),
      child: SizedBox(
        height: 35,
        width: width * 2,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: listName.length,
            itemBuilder: ((BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: index == sortIndex
                            ? Appcolors.primarycolor
                            : Colors.white,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                            side: BorderSide(
                              width: 1,
                              color: index == sortIndex
                                  ? Appcolors.primarycolor
                                  : Colors.grey.shade300,
                            ))),
                    onPressed: () {
                      setState(() {
                        sortIndex = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                      child: Text(
                        listName[index],
                        style: TextStyle(
                            color: index == sortIndex
                                ? Colors.white
                                : Appcolors.primarycolor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
              );
            })),
      ),
    );
  }

  Widget WrapButton() {
    return Wrap(
        alignment: WrapAlignment.start,
        direction: Axis.horizontal,
        spacing: 15,
        runSpacing: 0,
        children:
            <Widget>[
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
                  ),
                ),
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
                    page[index] = !page[index];
                    setState(() {});
                  }
                
                },
                child: Text(
                  ButtonList[index],
                  style: TextStyle(
                      color:
                          page[index] ? Colors.white : Appcolors.primarycolor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ));
          }),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Appcolors.primarycolor,
                  minimumSize: Size(20, 30),
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  )),
              onPressed: () {
                nextscreen(context, CategoriesFilter());
              },
              child: Icon(
                Icons.arrow_forward,
                size: 18,
              ))
        ]);
  }
}
