import 'package:digi_cart_furniture/component/widget.dart';
import 'package:digi_cart_furniture/screens/Authentication/password_change.dart';
import 'package:flutter/material.dart';

class newPassword extends StatefulWidget {
  const newPassword({super.key});

  @override
  State<newPassword> createState() => _newPasswordState();
}

class _newPasswordState extends State<newPassword> {
  var size, height, width;
  bool isvisible = false;

  void updateStatus() {
    setState(() {
      isvisible = !isvisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            Padding(
              padding: EdgeInsets.only(top: 30, left: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    // nextscreen(context, login());
                  },
                  child: Image(
                    image: AssetImage("assets/images/Arrow_Left_Circle.png"),
                    height: height * 0.1,
                    width: width * 0.1,
                  ),
                ),
              ),
            ),
            Container(
              height: height * 0.28,
              width: width,
              decoration: BoxDecoration(
                  // color: Colors.black,
                  image: DecorationImage(
                image: AssetImage(
                  "assets/images/Layer_1.png",
                ),
                fit: BoxFit.contain,
                repeat: ImageRepeat.noRepeat,
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 30, left: 20, right: 20, bottom: 12),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Create new password",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Your new password must be unique from those\npreviously used.",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.08,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
              child: TextFormField(
                style: TextStyle(color: Colors.black),
                cursorColor: Colors.grey,
                keyboardType: TextInputType.visiblePassword,
                decoration: textInputDecorationgrey.copyWith(
                    hintText: "New password",
                    suffixIcon: IconButton(
                      onPressed: () => updateStatus(),
                      icon: Icon(
                        isvisible ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey,
                        size: 18,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.grey,
                      size: 20,
                    )),
                obscureText: isvisible ? false : true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
              child: TextFormField(
                style: TextStyle(color: Colors.black),
                cursorColor: Colors.grey,
                keyboardType: TextInputType.visiblePassword,
                decoration: textInputDecorationgrey.copyWith(
                    hintText: "Confirm password",
                    suffixIcon: IconButton(
                      onPressed: () => updateStatus(),
                      icon: Icon(
                        isvisible ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey,
                        size: 18,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.grey,
                      size: 20,
                    )),
                obscureText: isvisible ? false : true,
              ),
            ),
            SizedBox(
              height: height * 0.08,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child:
                  elevatedButton(context, "Reset Password", passwordChange()),
            )
          ]),
        ));
  }
}
