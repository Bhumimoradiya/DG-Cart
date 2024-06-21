import 'package:digi_cart_furniture/component/appcolors.dart';
import 'package:digi_cart_furniture/screens/Profile/ProfileField/HelpCenter/HelpCenter/HelpCenterTabBar/contactUs.dart';
import 'package:flutter/material.dart';

import 'HelpCenterTabBar/faq.dart';

class helpCenter extends StatefulWidget {
  const helpCenter({super.key});

  @override
  State<helpCenter> createState() => _helpCenterState();
}

class _helpCenterState extends State<helpCenter> {
  List i = [0];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              // elevation: 0,
              centerTitle: true,
              title: Text(
                "Help Center",
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
                            labelColor: Color(0xFFFFAB40),
                            indicatorColor: Colors.orange.shade400,
                            indicatorWeight: 1.5,
                            tabs: [
                              Tab(
                                  child: Text(
                                "FAQ",
                                // style: TextStyle(color: Appcolors.primarycolor),
                              )),
                              Tab(
                                  child: Text(
                                "Contact Us",
                                // style: TextStyle(color: Appcolors.primarycolor),
                              ))
                            ]),
                      ),
                    ),
                  )),
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
                return i[0];
              },
              child: TabBarView(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [HelpCenterFAQ(), HelpCenterContactUs()],
              ),
            )));
  }
}
