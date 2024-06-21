import 'dart:convert';
import 'package:digi_cart_furniture/component/widget.dart';
import 'package:digi_cart_furniture/screens/Authentication/newPassword.dart';
import 'package:digi_cart_furniture/screens/Authentication/register.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:http/http.dart' as http;

import '../../component/appcolors.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({
    super.key,
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  var size, height, width;

  TextEditingController otpController = TextEditingController();
  void Otp(String otp) async {
    try {
      final response = await http.post(
          Uri.parse('http://192.168.0.123/Digi_Furniture/loginapi'),
          body: {'user_otp': otp});

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
        // nextscreen(context, widget.page());

        print('Login successfully');
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
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
                    "assets/images/OBJECTS_removebg.png",
                  ),
                  fit: BoxFit.contain,
                  //     width: width * 0.1,
                  // height: height * 0.1,
                  repeat: ImageRepeat.noRepeat,
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 30, left: 20, right: 20, bottom: 12),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "OTP Verification",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Enter the verification code we just sent on your\nemail address.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 30, right: 30, left: 30),
                  child: Column(
                    children: [
                      Pinput(
                        controller: otpController,
                        length: 6,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        defaultPinTheme: PinTheme(
                            height: 45.0,
                            width: 55.0,
                            textStyle: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: Colors.grey.shade400),
                                borderRadius: BorderRadius.circular(12),
                                shape: BoxShape.rectangle,
                                color: Colors.grey.shade100)),
                      ),
                      SizedBox(
                        height: height * 0.22,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)), backgroundColor: Appcolors.primarycolor,
                              minimumSize: Size(300, 55)),
                          onPressed: () {
                            nextscreen(context, newPassword());
                            // Otp(otpController.text.toString());
                          },
                          child: Center(
                            child: Text(
                              "Verify",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 25, right: 0),
                        child: Text.rich(TextSpan(
                            text: "Don't receive code? ",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                text: "Resend",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Appcolors.primarycolor,
                                    fontWeight: FontWeight.bold),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    nextscreen(context, Register());
                                  },
                              )
                            ])),
                      )
                    ],
                  )),
            ])));
  }
}
