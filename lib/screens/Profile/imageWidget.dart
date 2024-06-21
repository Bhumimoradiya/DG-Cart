import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';

String imageurl = '';
Future<void> requestPermission() async {
  final permission = Permission.location;

  if (await permission.isDenied) {
    await permission.request();
  }
}

class ImageWidget extends StatefulWidget {
  const ImageWidget(String s, {super.key});

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  
void _getFromCamera() async {
  PermissionStatus status = await Permission.storage.request();
  if (status.isDenied == true) {
    // openAppSettings();
    // code of read or write file in external storage (SD card)
    final image = await ImagePicker().pickImage(
        source: ImageSource.camera,
        maxWidth: 1800,
        maxHeight: 1800,
        imageQuality: 75);
    Reference ref = FirebaseStorage.instance.ref().child("profile.jpg");
    await ref.putFile(File(image!.path));
    ref.getDownloadURL().then((value) {
      log(value);
      setState(() {
        imageurl = value;
      });
    });
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Permission")));
  }
}

void _getFromGallery() async {
  PermissionStatus status = await Permission.storage.request();
  if (status.isDenied == true) {
    // openAppSettings();
    // code of read or write file in external storage (SD card)
    final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxWidth: 1800,
        maxHeight: 1800,
        imageQuality: 75);
    Reference ref = FirebaseStorage.instance.ref().child("profile.jpg");
    await ref.putFile(File(image!.path));
    ref.getDownloadURL().then((value) {
      log(value);
      setState(() {
        imageurl = value;
      });
    });
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Permission")));
  }
}

  @override
  Widget build(BuildContext context) {
    return Row();
  }
}
