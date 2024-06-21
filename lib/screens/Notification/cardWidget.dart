import 'package:digi_cart_furniture/component/appcolors.dart';
import 'package:flutter/material.dart';

class cardWidget extends StatefulWidget {
  const cardWidget(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle});
  final String image;
  final String title;
  final String subTitle;
  @override
  State<cardWidget> createState() => _cardWidgetState();
}

class _cardWidgetState extends State<cardWidget> {
  var size, height, width;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        shadowColor: Colors.transparent,
        color: Color.fromARGB(95, 238, 238, 238),
        child: Container(
          height: 110,
          width: width,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 14, top: 15, right: 15, bottom: 15),
            child: Row(
              children: [
                CircleAvatar(
                  minRadius: 35,
                  backgroundColor: Appcolors.primarycolor,
                  child: Image.asset(
                    widget.image,
                    height: 35,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 16.5),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      widget.subTitle,
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.5),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
