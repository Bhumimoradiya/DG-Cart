import 'package:digi_cart_furniture/component/widget.dart';
import 'package:digi_cart_furniture/screens/Cart/payment.dart';
import 'package:flutter/material.dart';

import '../../component/appcolors.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({super.key});

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods>
    with SingleTickerProviderStateMixin {
  var size, height, width;
  int currentIndex = 1;

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
            "Payment Methods",
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
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            children: [
              cardWidget(
                  name: "Online Payment",
                  image: "assets/images/money-transfer 1.png",
                  currentindex: 1),
              cardWidget(
                  name: "Cash on Delivery",
                  image: "assets/images/cash-on-delivery (1) 1.png",
                  currentindex: 2),
            ],
          ),
        ),
        bottomNavigationBar: Row(children: [
          Container(
              width: width,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      blurStyle: BlurStyle.outer,
                      blurRadius: 5,
                      spreadRadius: 0.6,
                    )
                  ],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35))),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 25, bottom: 25),
                child: elevatedButton(context, "Continue", Payment()),
              ))
        ]));
  }

  Widget cardWidget({
    required String name,
    required String image,
    required int currentindex,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = currentindex;
        });
      },
      child: Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child: Card(
              shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(30)),
              shadowColor: Colors.transparent,
              // color: Color.fromARGB(95, 238, 238, 238),
              child: Container(
                  height: 90,
                  width: width,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          left: 0, top: 16, right: 0, bottom: 10),
                      child: ListTile(
                        title: Text(
                          name,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 18),
                        ),
                        leading: Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              shape: BoxShape.circle),
                          child: Padding(
                            padding: const EdgeInsets.all(7),
                            child: CircleAvatar(
                              minRadius: 25,
                              backgroundColor: Appcolors.primarycolor,
                              child: Image.asset(
                                image,
                                height: 25,
                              ),
                            ),
                          ),
                        ),
                        trailing: Radio<int>(
                          fillColor: MaterialStateColor.resolveWith((states) =>
                              currentIndex == currentindex
                                  ? Appcolors.primarycolor
                                  : Colors.grey.shade300),
                          value: currentindex,
                          groupValue: currentIndex,
                          onChanged: (int? value) {
                            setState(() {
                              currentIndex = value!;
                            });
                          },
                        ),
                      ))))),
    );
  }
}
