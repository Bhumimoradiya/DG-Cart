// ignore_for_file: body_might_complete_normally_catch_error, avoid_types_as_parameter_names, non_constant_identifier_names

import 'dart:developer';

import 'package:digi_cart_furniture/screens/Authentication/UserDetail/UserModel.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  CreateUser(UserModel user) async {
    log("------Inside CreateUser----");
    await _db.collection("User_Details").add(user.toJson()).whenComplete(() {
      log("--------User Added---------- name :" "${user.name}");
      log("--------User Added---------- id :" "${user.id}");
    }).catchError((error, StackTrace) {
      log("---------------${error.toString()}------------");
    });
  }

  Future<UserModel> getUserDetails(String email) async {
    final snapshot = await _db
        .collection("User_Details")
        .where("Email_Id", isEqualTo: email)
        .get();

    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    log("USER DATA ----1------- $userData");
    return userData;
  }

  Future<List> allUSer(String email) async {
    final snapshot = await _db.collection("User_Details").get();
    final userData =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    // log();
    log("USER DATA -----2------ $userData");
    return userData;
  }
}
