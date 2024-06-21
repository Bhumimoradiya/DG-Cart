import 'dart:convert';
import 'dart:developer';

import 'package:digi_cart_furniture/component/appcolors.dart';
import 'package:digi_cart_furniture/component/widget.dart';
import 'package:digi_cart_furniture/screens/Authentication/Login/login.dart';
import 'package:digi_cart_furniture/screens/Authentication/UserDetail/UserModel.dart';
// import 'package:digi_cart_furniture/screens/Authentication/UserDetail/UserModel.dart';
import 'package:digi_cart_furniture/screens/Authentication/UserDetail/userRepository.dart';
import 'package:digi_cart_furniture/screens/Authentication/emailVerified.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import '../Homepage/homepage.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var email = "";
  var password = "";
  var username = "";
  var number = "";

  void register(
    String name,
    email,
    password,
    phoneNumber,
  ) async {
    try {
      final response = await http.post(
          Uri.parse('http://192.168.0.123/Digi_Furniture/register'),
          body: {
            'user_name': name,
            'user_email': email,
            'user_password': password,
            'user_mobile': phoneNumber,
          });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
        nextscreen(context, Homepage());
        // nextscreen(context, Auth());
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
      return Colors.black;
    }
    return Colors.black;
  }

  void updateStatus() {
    setState(() {
      isvisible = !isvisible;
    });
  }

  final _formkey = GlobalKey<FormState>();
  // String userId = '';
  // final Usermodel = UserModel;
  createUserWithEmailAndPassword() async {
    try {
      UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      User? user = credential.user;
      user!.updateProfile(displayName: username);
      int userId = credential.user!.hashCode;
      log("useridddddd :${userId}");
      // setState(() {
      // });
      // if (user != '') {
      final Usermodel = UserModel(
          id: userId,
          name: nameController.text.trim(),
          mobile_no: phoneNumberController.text.trim(),
          email_id: emailController.text.trim());
      log("userid : ${userId}");
      // return Usermodel;
      // }
      //  nextscreen(context, bottomNavigationBar());
      // nextscreen(context, registerAccount());
      await _createuser(Usermodel);
      nextscreen(context, EmailVerified());

      // return ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(content: Text('Account Created Successfully!!')));
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return errorSnackbar(context, 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return errorSnackbar(
            context, 'The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  final userRepo = Get.put(UserRepository());
  Future<void> _createuser(UserModel user) async {
    await userRepo.CreateUser(user);
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    // final user = UserModel(
    //     id: userId,
    //     name: nameController.text.trim(),
    //     mobile_no: phoneNumberController.text.trim(),
    //     email_id: emailController.text.trim());
    return Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _formkey,
          child: SingleChildScrollView(
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
                        image:
                            AssetImage("assets/images/Arrow_Left_Circle.png"),
                        height: height * 0.1,
                        width: width * 0.1,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    height: height * 0.25,
                    width: width,
                    decoration: BoxDecoration(
                        // color: Colors.black,
                        image: DecorationImage(
                      image: AssetImage(
                        "assets/images/Frame.png",
                      ),
                      fit: BoxFit.contain,
                      repeat: ImageRepeat.noRepeat,
                    )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 30, left: 20, right: 20, bottom: 12),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Let's get started!",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 25),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Username",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
                  child: TextFormField(
                    controller: nameController,
                    style: TextStyle(color: Colors.grey),
                    cursorColor: Colors.grey,
                    keyboardType: TextInputType.text,
                    decoration: textInputDecorationgrey.copyWith(
                        hintText: "Enter your name",
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.grey.shade600,
                          size: 20,
                        )),
                    onChanged: (value) {
                      setState(() {
                        username = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "*Username cannot be empty";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 25),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Email",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
                  child: TextFormField(
                    controller: emailController,
                    style: TextStyle(color: Colors.grey),
                    cursorColor: Colors.grey,
                    keyboardType: TextInputType.emailAddress,
                    decoration: textInputDecorationgrey.copyWith(
                        hintText: "Enter your email",
                        prefixIcon: Icon(
                          Icons.mail_rounded,
                          color: Colors.grey.shade600,
                          size: 20,
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
                  padding: const EdgeInsets.only(top: 10, left: 25),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Contact number",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
                  child: TextFormField(
                    controller: phoneNumberController,
                    style: TextStyle(color: Colors.grey),
                    cursorColor: Colors.grey,
                    keyboardType: TextInputType.number,
                    decoration: textInputDecorationgrey.copyWith(
                        hintText: "Permanent number",
                        prefixIcon: Icon(
                          Icons.call,
                          color: Colors.grey.shade600,
                          size: 20,
                        )),
                    onChanged: (value) {
                      setState(() {
                        number = value;
                      });
                    },
                    validator: (Value) {
                      if (Value!.isEmpty) {
                        return "*Contact number cannot be empty.";
                      } else if (Value.length < 10) {
                        return "Contact number length should be at least \n10 characters long.";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 25),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Password",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
                  child: TextFormField(
                    controller: passwordController,
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                    cursorColor: Colors.grey,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: textInputDecorationgrey.copyWith(
                        hintText: "Enter your password",
                        suffixIcon: IconButton(
                          onPressed: () => updateStatus(),
                          icon: Icon(
                            isvisible ? Icons.visibility : Icons.visibility_off,
                            color: Colors.grey.shade600,
                            size: 18,
                          ),
                        ),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.grey.shade600,
                          size: 20,
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
                  child: Row(children: [
                    Checkbox(
                      checkColor: Colors.white,
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
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Text.rich(TextSpan(
                          text: "I agree with the ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                              text: "Terms of service ",
                              style: TextStyle(
                                  color: Appcolors.primarycolor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: "& privacy\npolicy.",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            )
                          ])),
                    ),
                  ]),
                ),
                SizedBox(
                  height: height * 0.07,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            backgroundColor: Appcolors.primarycolor,
                            minimumSize: Size(300, 55)),
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            setState(() {
                              email = emailController.text;
                              password = passwordController.text;
                              number = phoneNumberController.text;
                              username = nameController.text;
                            });
                            createUserWithEmailAndPassword();
                            // _createuser(user);
                          }
                          // register(
                          //     nameController.text.toString(),
                          //     emailController.text.toString(),
                          //     phoneNumberController.text.toString(),
                          //     passwordController.text.toString());
                        },
                        child: Center(
                          child: Text(
                            "Register",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ))),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: Center(
                    child: Text.rich(TextSpan(
                        text: "Do you have an account? ",
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text: "Sign in",
                            style: TextStyle(
                                fontSize: 13,
                                color: Appcolors.primarycolor,
                                fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                nextscreen(context, login());
                              },
                          )
                        ])),
                  ),
                )
              ])),
        ));
  }
}
