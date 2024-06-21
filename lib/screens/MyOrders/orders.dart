import 'package:digi_cart_furniture/component/appcolors.dart';
import 'package:digi_cart_furniture/component/widget.dart';
import 'package:digi_cart_furniture/screens/MyOrders/OrderTabBar/completed.dart';
import 'package:digi_cart_furniture/screens/MyOrders/OrderTabBar/pending.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: Colors.grey.shade100,
            appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Appcolors.primarycolor,
                centerTitle: true,
                title: Text(
                  "My Orders",
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
                shadowColor: Colors.transparent,
                bottom: PreferredSize(
                    preferredSize: Size.fromHeight(35),
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              bottom: BorderSide(
                                  color: Appcolors.primarycolor, width: 1.5),
                            ),
                          ),
                          child: TabBar(
                              automaticIndicatorColorAdjustment: false,
                              labelColor: Color(0xFFFFAB40),
                              indicatorColor: Colors.orange.shade400,
                              indicatorWeight: 1.5,
                              dragStartBehavior: DragStartBehavior.down,
                              tabs: [
                                Tab(
                                    child: Text(
                                  "Pending",
                                  // style: TextStyle(color: Appcolors.primarycolor),
                                )),
                                Tab(
                                    child: Text(
                                  "Completed",
                                  // style: TextStyle(color: Appcolors.primarycolor),
                                ))
                              ]),
                        ),
                      ),
                    ))),
            body: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (OverscrollIndicatorNotification overscroll) {
                overscroll.disallowIndicator();
                return size[0];
              },
              child: TabBarView(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [Pending(), Completed()],
              ),
            )));
  }
}
