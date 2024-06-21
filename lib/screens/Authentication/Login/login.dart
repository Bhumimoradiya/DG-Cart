import 'dart:convert';
import 'dart:developer';
import 'package:digi_cart_furniture/component/appcolors.dart';
import 'package:digi_cart_furniture/component/widget.dart';
import 'package:digi_cart_furniture/screens/Authentication/forgotpassword.dart';
import 'package:digi_cart_furniture/screens/Authentication/register.dart';
import 'package:digi_cart_furniture/screens/BottomNavigationBar.dart';
import 'package:digi_cart_furniture/screens/Homepage/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var email = "";
  var password = "";

  void Login(String email, password) async {
    try {
      final response = await http.post(
          Uri.parse('http://192.168.0.123/Digi_Furniture/loginapi'),
          body: {'user_email': email, 'user_password': password});

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
        nextscreen(context, Homepage());
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          elevation: 2,
          duration: Duration(seconds: 1),
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          content: Container(
              height: 50,
              color: Appcolors.primarycolor,
              child: Padding(
                padding: EdgeInsets.only(top: 15, left: 10),
                child: Text(
                  'Login Successfully!!',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
              )),
          backgroundColor: Appcolors.primarycolor,
        ));
        print('Login successfully');
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  var size, height, width;
  bool isvisible = false;
  bool isChecked = false;
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.white;
    }
    return Colors.white;
  }

  // Authservices authservices = Authservices();
  // bool isloading = false;
  void updateStatus() {
    setState(() {
      isvisible = !isvisible;
    });
  }

  final _formkey = GlobalKey<FormState>();
  signInWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      // successSnackbar(context, 'Login Successfully!!');
      nextscreen(
          context,
          bottomNavigationBar(
            myIndex: 0,
          ));
      return successSnackbar(context, 'Login Successfully!!');
    } on FirebaseAuthException catch (e) {
      log("loggg ${e.code}");
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return errorSnackbar(context, "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return errorSnackbar(context, 'Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
        body: Form(
      key: _formkey,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.72), BlendMode.dstATop),
                image: AssetImage(
                  "assets/images/pillow-light-indoor-modern-room 1.png",
                ),
                fit: BoxFit.cover,
                repeat: ImageRepeat.noRepeat,
                opacity: 500)),
        child: SingleChildScrollView(
          // scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                // height: height * 0.05,
                height: 40,
              ),
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                    style: ButtonStyle(
                        overlayColor:
                            MaterialStatePropertyAll(Colors.transparent)),
                    onPressed: () {
                      nextscreen(
                          context,
                          bottomNavigationBar(
                            myIndex: 0,
                          ));
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 120, left: 25),
                child: Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 25),
                child: Text(
                  "Welcome back! Please login to your\naccount.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 25),
                child: Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: textInputDecorationwhite.copyWith(
                      hintText: "Enter your email",
                      prefixIcon: Icon(
                        Icons.mail_rounded,
                        color: Colors.white,
                        size: 22,
                      )),
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "*Email cannot be empty";
                    } else if (!value.contains('@')) {
                      return "You have entered an invalid e-mail address.\nPlease try again.";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 25),
                child: Text(
                  "Password",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordController,
                  decoration: textInputDecorationwhite.copyWith(
                      hintText: "Enter your password",
                      suffixIcon: IconButton(
                        onPressed: () => updateStatus(),
                        icon: Icon(
                          isvisible ? Icons.visibility : Icons.visibility_off,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.white,
                        size: 22,
                      )),
                  obscureText: isvisible ? false : true,
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  validator: (Value) {
                    if (Value!.isEmpty) {
                      return "*Password cannot be empty.";
                    } else if (Value.length < 6) {
                      return "Password length should be at least 6 characters\nlong.";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          checkColor: Colors.black,
                          fillColor: MaterialStateColor.resolveWith(getColor),
                          value: isChecked,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                        Text(
                          "Remember Me",
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0, right: 10),
                      child: TextButton(
                          style: ButtonStyle(
                              overlayColor:
                                  MaterialStatePropertyAll(Colors.transparent)),
                          onPressed: () {
                            nextscreen(context, ForgotPassword());
                          },
                          child: Text(
                            "Forgot password?",
                            style: TextStyle(
                                color: Appcolors.primarycolor,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                // height: height * 0.1,
                height: 70,
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)), backgroundColor: Appcolors.primarycolor,
                          minimumSize: Size(300, 55)),
                      onPressed: () {
                        // Login(emailController.text.toString(),
                        //     passwordController.text.toString());
                        if (_formkey.currentState!.validate()) {
                          // setState(() {
                          //   email = emailController.text;
                          //   password = passwordController.text;
                          // });
                          // nextscreen(context, Homepage());
                          signInWithEmailAndPassword();
                        }
                      },
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ))),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: Text.rich(TextSpan(
                    text: "New User? ",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(
                        text: "Signup",
                        style: TextStyle(
                            fontSize: 13,
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
          ),
        ),
      ),
    ));
  }

  // login() async {
  //   if (_formkey.currentState!.validate()) {
  //     setState(() {
  //       isloading = true;
  //     });
  //     await authservices
  //         .loginwithusenameandpassword(email, password)
  //         .then((value) async {
  //       if (value == true) {
  //         QuerySnapshot snapshot =
  //             await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
  //                 .gettinguserdata(email);
  //         await helperfunction.saveUserLoggedInStatus(true);
  //         await helperfunction.saveUserEmailSF(email);

  //         nextscreen(context, Homepage());
  //       } else {
  //         showSnackbar(context, Color(0xFFee7b64), value);
  //         setState(() {
  //           isloading = false;
  //         });
  //       }
  //     });
  //   }
  // }
}
