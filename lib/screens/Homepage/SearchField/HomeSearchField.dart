import 'package:digi_cart_furniture/component/widget.dart';
import 'package:digi_cart_furniture/screens/Homepage/SearchField/searchPage.dart';
import 'package:digi_cart_furniture/screens/Homepage/SearchField/sort&Filter.dart';
import 'package:flutter/material.dart';

class HomeSearchField extends StatefulWidget {
  const HomeSearchField({super.key});

  @override
  State<HomeSearchField> createState() => _HomeSearchFieldState();
}

class _HomeSearchFieldState extends State<HomeSearchField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Container(
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 4,
                      offset: Offset(0, 5),
                      spreadRadius: 1),
                  BoxShadow(color: Colors.white, offset: Offset(0, 0)),
                  BoxShadow(color: Colors.white, offset: Offset(0, 0))
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    nextscreen(context, searchPage());
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 13, bottom: 13, left: 13, right: 8),
                        child: ImageIcon(
                          AssetImage(
                            "assets/images/SearchBlack.png",
                          ),
                          size: 18,
                          color: Colors.grey.shade300,
                        ),
                      ),
                      Text(
                        "Search here..",
                        style: TextStyle(
                          color: Colors.grey.shade300,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {
                      nextscreen(context, Sort_Filter());
                    },
                    icon: ImageIcon(
                      AssetImage(
                        "assets/images/Filter.png",
                      ),
                      size: 21,
                      color: Colors.black,
                    ))
              ],
            )

            //  TextFormField(
            //   keyboardType: TextInputType.text,
            // style: TextStyle(
            //   color: Colors.grey,
            //   fontSize: 16,
            // ),
            //   cursorColor: Colors.grey,
            //   decoration: InputDecoration(
            //       contentPadding: EdgeInsets.symmetric(vertical: 0),
            //       enabledBorder: OutlineInputBorder(
            //           borderRadius: BorderRadius.all(Radius.circular(40)),
            //           borderSide: BorderSide.none),
            //       focusedBorder: OutlineInputBorder(
            //           borderRadius: BorderRadius.all(Radius.circular(40)),
            //           borderSide: BorderSide.none),
            //       filled: true,
            //       fillColor: Colors.white,
            //       border: InputBorder.none,
            //       disabledBorder: InputBorder.none,
            //       hintText: "Search here..",
            //       hintStyle: TextStyle(fontSize: 14),
            // prefixIcon: Padding(
            //   padding: const EdgeInsets.only(left: 10, right: 5),
            //   child: Icon(
            //     Icons.search_rounded,
            //     size: 25,
            //     color: Colors.grey,
            //   ),
            // ),
            //       prefixIconColor: Colors.grey,
            // suffixIcon: IconButton(
            //   onPressed: () {
            //     nextscreen(context, Sort_Filter());
            //   },
            //   icon: Icon(
            //     Icons.swap_horiz,
            //     color: Colors.black,
            //   ),
            // )),
            // )
            ));
  }
}
