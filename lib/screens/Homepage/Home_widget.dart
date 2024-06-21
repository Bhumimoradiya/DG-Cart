import 'package:digi_cart_furniture/component/widget.dart';
import 'package:flutter/material.dart';

Widget viewall(context, page, color) {
  return TextButton(
    style:
        ButtonStyle(overlayColor: MaterialStatePropertyAll(Colors.transparent)),
    onPressed: () {
      nextscreen(context, page);
    },
    child: Text(
      "View All",
      style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.bold),
    ),
  );
}

Widget ProductNameViewall(context,
    {required page, required String name, required Color color}) {
  return Padding(
    padding: const EdgeInsets.only(left: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: TextStyle(
              color: color, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        // SizedBox(
        //   width: width * 0.5,
        // ),
        viewall(context, page, color)
      ],
    ),
  );
}
