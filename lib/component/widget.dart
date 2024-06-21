import 'package:digi_cart_furniture/component/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

var size, height, width;

const textInputDecorationwhite = InputDecoration(
  errorStyle: TextStyle(fontWeight: FontWeight.w500),
  hintStyle: TextStyle(color: Colors.white),
  labelStyle: TextStyle(color: Colors.white),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white,
        width: 1,
      ),
      borderRadius: BorderRadius.all(Radius.circular(12))),
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white,
        width: 1,
      ),
      borderRadius: BorderRadius.all(Radius.circular(12))),
  errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.red,
        // width: 2,
      ),
      borderRadius: BorderRadius.all(Radius.circular(12))),
  focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.red,
        width: 1,
      ),
      borderRadius: BorderRadius.all(Radius.circular(12))),
);
const textInputDecorationgrey = InputDecoration(
  errorStyle: TextStyle(fontWeight: FontWeight.w400),
  hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
  labelStyle: TextStyle(color: Colors.grey),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
        width: 1,
      ),
      borderRadius: BorderRadius.all(Radius.circular(12))),
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
        width: 1,
      ),
      borderRadius: BorderRadius.all(Radius.circular(12))),
  errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.red,
        // width: 2,
      ),
      borderRadius: BorderRadius.all(Radius.circular(12))),
  focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.red,
        width: 1,
      ),
      borderRadius: BorderRadius.all(Radius.circular(12))),
);
nextscreen(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (_) => page));
}

//Slider Screen Text
String page1_imageurl = "assets/images/aestheticroom.png";
String page1_title = "We Provide High";
String page1_title2 = "Quality Products Just";
String page1_title3 = "For You";
Color page1_color = Appcolors.primarycolor;
String page2_imageurl = "assets/images/velvet-armchair.png";
String page2_title = "Your Satisfaction Is";
String page2_title2 = "Our Number One";
String page2_title3 = "Priority";
String page3_imageurl = "assets/images/room-interior-design.png";
String page3_title = "Let's Fulfill Your House";
String page3_title2 = "Needs With Finicial";
String page3_title3 = "Right Now!";
Widget elevatedButton(context, text, page) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          backgroundColor: Appcolors.primarycolor,
          minimumSize: Size(300, 55)),
      onPressed: () {
        nextscreen(context, page);
      },
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ));
}

void showSnackbar(context, color, message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    backgroundColor: color,
    duration: Duration(seconds: 2),
    action: SnackBarAction(
      label: "Ok",
      onPressed: () {},
      textColor: Colors.white,
    ),
  ));
}

void successSnackbar(context, text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      // padding: EdgeInsets.only(top: 150),
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 150,
        left: 10,
        right: 10,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: Colors.green,
      elevation: 10,
      content: Row(
        children: [
          Icon(
            Icons.verified,
            color: Colors.white,
          ),
          SizedBox(width: 5),
          Text(text),
        ],
      )));
}

AnimationController? localAnimationController;
// void errorSnackbar(context, text) {
//   Flushbar(
//     title: text,
//     backgroundColor: Colors.green,
//     flushbarPosition: FlushbarPosition.TOP,
//   );
// }
void errorSnackbar(context, text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 100,
        left: 10,
        right: 10,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: Colors.red,
      elevation: 10,
      content: Row(
        children: [
          Icon(
            Icons.error,
            color: Colors.white,
          ),
          SizedBox(width: 5),
          Column(
            children: [
              Text(text),
            ],
          ),
        ],
      )));
}

enum AuthStatus {
  successful,
  wrongPassword,
  emailAlreadyExists,
  invalidEmail,
  weakPassword,
  unknown,
}

class AuthExceptionHandler {
  static handleAuthException(FirebaseAuthException e) async {
    AuthStatus status;
    switch (e.code) {
      case "invalid-email":
        status = AuthStatus.invalidEmail;
        break;
      case "wrong-password":
        status = AuthStatus.wrongPassword;
        break;
      case "weak-password":
        status = AuthStatus.weakPassword;
        break;
      case "email-already-in-use":
        status = AuthStatus.emailAlreadyExists;
        break;
      default:
        status = AuthStatus.unknown;
    }
    return status;
  }
}
