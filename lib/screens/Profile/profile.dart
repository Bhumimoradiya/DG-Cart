import 'dart:developer';
import 'dart:io';
import 'package:digi_cart_furniture/screens/Authentication/Login/login.dart';
import 'package:digi_cart_furniture/screens/MyOrders/orders.dart';
import 'package:digi_cart_furniture/screens/Profile/ProfileField/contactUs.dart';
import 'package:digi_cart_furniture/screens/Profile/ProfileField/editProfile.dart';
import 'package:digi_cart_furniture/screens/Profile/ProfileField/HelpCenter/HelpCenter/helpCenter.dart';
import 'package:digi_cart_furniture/screens/Profile/ProfileField/profileAddress.dart';
import 'package:digi_cart_furniture/screens/Profile/imageWidget.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:digi_cart_furniture/component/appcolors.dart';
import 'package:digi_cart_furniture/component/widget.dart';
import 'package:digi_cart_furniture/screens/Profile/ProfileField/notification.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
  import 'package:permission_handler/permission_handler.dart';
import 'ProfileField/privacyPolicy.dart';

class Profile extends StatefulWidget {
  const Profile({
    super.key,
  });
  // final imageFile;
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final user = FirebaseAuth.instance.currentUser;

  File? imageFile;
  ImagePicker picker = ImagePicker();
  bool isPicked = false;
  // Future<bool> _requestPermission() async {
  //   Map<Permission, PermissionStatus> result =
  //       await [Permission.storage, Permission.camera].request();
  //   if (result[Permission.storage] == PermissionStatus.granted &&
  //       result[Permission.camera] == PermissionStatus.granted) {
  //     return true;
  //   }
  //   return false;
  // }
  // Future<void> requestPermission() async {
  //   final permission = Permission.location;

  //   if (await permission.isDenied) {
  //     await permission.request();
  //   }
  // }

  // File? image = await picker.pickImage(source: ImageSource.gallery);
  // final ImagePicker _picker = ImagePicker();
  List profileFieldList = [
    editProfile(),
    profileAddress(),
    Orders(),
    notification(),
    privacyPolicy(),
    helpCenter(),
    contactUs()
  ];
  List image = [
    "assets/images/Profile_1.png",
    "assets/images/Location_!.png",
    "assets/images/Buy1.png",
    "assets/images/Notification1.png",
    "assets/images/Lock1.png",
    "assets/images/Info Square.png",
    "assets/images/Call1.png",
  ];
  List field = [
    "Edit Profile",
    "Address",
    "My Orders",
    "Notification",
    "Privacy Policy",
    "Help Center",
    "Contact Us",
  ];
  String imageurl = '';
  FirebaseStorage storage = FirebaseStorage.instance;

  Future<String> getDownloadImage() async {
    final imagePath = await storage.ref('profile.jpg').getDownloadURL();
    return imagePath;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // elevation: 0,

        automaticallyImplyLeading: false,
        backgroundColor: Appcolors.primarycolor,
        centerTitle: true,
        title: Text(
          "My Profile",
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        shadowColor: Colors.transparent,
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 28),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Center(
              child: FutureBuilder(
                  future: getDownloadImage(),
                  builder: (context, snapshot) {
                    return Stack(
                      children: [
                        // CircleAvatar(
                        // radius: 55,
                        // imageFile != null
                        //     ? Image.file(
                        //         File(imageFile!.path),
                        //         fit: BoxFit.cover,
                        //       ).image
                        //     :AssetImage(
                        //             "assets/images/image 19.png")),
                        // imageurl == ''
                        snapshot.connectionState == ConnectionState.waiting ||
                                !snapshot.hasData
                            ? CircleAvatar(
                                maxRadius: 57,
                                backgroundColor: Appcolors.primarycolor,
                                child: CircleAvatar(
                                  maxRadius: 55,
                                  backgroundColor: Colors.white,
                                ))
                            : CircleAvatar(
                                maxRadius: 57,
                                backgroundColor: Appcolors.primarycolor,
                                child: CircleAvatar(
                                    maxRadius: 55,
                                    backgroundColor: Colors.white,
                                    backgroundImage:
                                        // imageFile != null
                                        // ?
                                        // Image.file(
                                        //     File(widget.imageFile!.path),
                                        //     fit: BoxFit.cover,
                                        //   ).image
                                        // :
                                        // AssetImage("assets/images/image 19.png")
                                        NetworkImage(snapshot.data!)),
                              ),
                        // ? CircleAvatar(
                        //     maxRadius: 57,
                        //     backgroundColor:
                        //         Appcolors.primarycolor,
                        //     child: CircleAvatar(
                        //         backgroundColor:
                        //             Appcolors.primarycolor,
                        //         maxRadius: 55,
                        //         // backgroundImage: imageurl == ''
                        //         // ? AssetImage(
                        //         //         "assets/images/image 19.png")
                        //         //     :
                        //         backgroundImage:
                        //             NetworkImage(snapshot.data!)),
                        //   )
                        // // CircleAvatar(
                        // //     backgroundColor: Appcolors.primarycolor,
                        // //     maxRadius: 55,
                        // //     // backgroundImage: imageurl == ''
                        // //     // ? AssetImage(
                        // //     //         "assets/images/image 19.png")
                        // //     //     :
                        // //     backgroundImage: AssetImage(
                        // //         "assets/images/image 19.png"))
                        // : CircleAvatar(
                        //     maxRadius: 57,
                        //     backgroundColor:
                        //         Appcolors.primarycolor,
                        //     child: CircleAvatar(
                        //       backgroundColor: Colors.white,
                        //       maxRadius: 55,
                        //       // backgroundImage: imageurl == ''
                        //       //     ? AssetImage(
                        //       //             "assets/images/image 19.png")
                        //       //     :
                        //       backgroundImage:
                        //           NetworkImage(imageurl),
                        //     ),
                        //   ),
                        Positioned(
                            // top: height * 0.10,
                            top: 78,
                            // left: width * 0.19,
                            left: 70,
                            child: CircleAvatar(
                              maxRadius: 17,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                maxRadius: 15,
                                backgroundColor: Appcolors.primarycolor,
                                child: InkWell(
                                  onTap: () {
                                    bottomeSheet();
                                  },
                                  child: Image.asset(
                                    "assets/images/Camera.png",
                                    height: 15,
                                  ),
                                ),
                              ),
                            ))
                      ],
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    // "Yogesh Patel",
                    user?.displayName == null
                        ? "Yogesh Patel"
                        : "${user?.displayName.toString()}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Image.asset(
                      "assets/images/Edit1.png",
                      height: 12,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              // "sridix@gmail.com",
              user?.email == null
                  ? "sridix@gmail.com"
                  : "${user?.email.toString()}",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.grey.shade400),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              child: Divider(
                height: 1,
                color: Colors.grey.shade100,
                thickness: 1,
              ),
            ),
            profileField(),
            GestureDetector(
              onTap: () {
                LogOutBottomSheet();
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 18),
                      child: Row(
                        children: [
                          ImageIcon(
                            AssetImage("assets/images/power (1) 1.png"),
                            size: 22,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Logout",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ])),
    );
  }

  LogOutBottomSheet() {
    return showModalBottomSheet(
        useSafeArea: false,
        elevation: 2,
        enableDrag: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  27,
                ),
                topRight: Radius.circular(
                  27,
                ))),
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return SizedBox(
            // height: height * 0.27,
            height: 190,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Container(
                    height: 2,
                    width: 40,
                    color: Colors.grey.shade300,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: Text(
                    "Logout",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 21),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    "Are you sure you want to log out?",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                        fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 14, right: 14, bottom: 10, top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shadowColor: Colors.transparent, backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  side: BorderSide(
                                      width: 1, color: Appcolors.primarycolor)),
                              fixedSize: Size(160, 49)),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                                color: Appcolors.primarycolor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shadowColor: Colors.transparent, backgroundColor: Appcolors.primarycolor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                fixedSize: Size(162, 45)),
                            onPressed: () async {
                              nextscreen(context, login());
                              // await FirebaseAuth.instance.signOut();
                            },
                            child: Text(
                              "Log Out",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget profileField() {
    return SizedBox(
      // height: height * 0.42,
      height: 325,
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: image.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                nextscreen(context, profileFieldList[index]);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // title: Text(
                    //   field,
                    //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18),
                      child: Row(
                        children: [
                          ImageIcon(
                            AssetImage(image[index]),
                            size: 21,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            field[index],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  // /// Get from gallery
  // _getFromGallery() async {
  // XFile? pickedFile = await ImagePicker().pickImage(
  //   source: ImageSource.gallery,
  //   maxWidth: 1800,
  //   maxHeight: 1800,
  // );
  //   if (pickedFile != null) {
  //     setState(() {
  //       imageFile = File(pickedFile.path);
  //       setState(() {
  //         isPicked = true;
  //       });
  //     });
  //   }
  // }
  Future<String?> _getFromGallery() async {
    PermissionStatus permissionStatus = await Permission.photos.request();

    // if (status.isDenied == true ||
    //     status.isPermanentlyDenied == true ||
    //     status.isGranted == true) {
    if (permissionStatus.isDenied == true) {
      // openAppSettings();
      // code of read or write file in external storage (SD card)
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          maxWidth: 1800,
          maxHeight: 1800,
          imageQuality: 75);
      Reference ref = FirebaseStorage.instance.ref().child("profile.jpg");
      await ref.putFile(File(image!.path));
      ref.getDownloadURL().then((value) async {
        log(value);
        setState(() {
          imageurl = value;
          // drawer(profile: imageurl);
        });
      });

      final String downloadurl = await ref.getDownloadURL();
      ImageWidget(downloadurl);
      return downloadurl;
    } else {
      // ScaffoldMessenger.of(context)
      //     .showSnackBar(SnackBar(content: Text("Permission")));
    }
    return null;
  }

  // /// Get from Camera
  // _getFromCamera() async {
  //   XFile? pickedFile = await ImagePicker().pickImage(
  //     source: ImageSource.camera,
  //     maxWidth: 1800,
  //     maxHeight: 1800,
  //   );
  //   if (pickedFile != null) {
  //     setState(() {
  //       imageFile = File(pickedFile.path);
  //       setState(() {
  //         isPicked = true;
  //       });
  //     });
  //   }
  // }

  void _getFromCamera() async {
    PermissionStatus permissionStatus = await Permission.camera.request();
    // if (status.isDenied == true ||
    //     status.isPermanentlyDenied == true ||
    //     status.isGranted == true) {
    if (permissionStatus.isDenied == true) {
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

  bottomeSheet() {
    return showModalBottomSheet(
        useSafeArea: false,
        elevation: 2,
        enableDrag: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  25,
                ),
                topRight: Radius.circular(
                  25,
                ))),
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return SizedBox(
            height: height * 0.2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Container(
                    height: 2,
                    width: 32,
                    color: Colors.grey.shade300,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: Text(
                    "Choose Profile photo",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _getFromCamera();
                            Navigator.pop(context);
                            // takephoto(ImageSource.camera);
                          },
                          child: CircleAvatar(
                              maxRadius: 24,
                              backgroundColor: Appcolors.primarycolor,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ImageIcon(
                                  AssetImage("assets/images/Camera.png"),
                                  size: 26,
                                  color: Colors.white,
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Camera",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _getFromGallery();
                            Navigator.pop(context);
                            // takephoto(ImageSource.gallery);
                          },
                          child: CircleAvatar(
                            maxRadius: 24,
                            backgroundColor: Appcolors.primarycolor,
                            child: Icon(
                              Icons.image,
                              size: 26,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Gallery",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                )
                // Padding(
                //   padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
                //   child: ElevatedButton(
                //       style: ElevatedButton.styleFrom(
                //           shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(25)),
                //           primary: Appcolors.primarycolor,
                //           minimumSize: Size(300, 55)),
                //       onPressed: () {
                //         Navigator.pop(context);
                //       },
                //       child: Center(
                //         child: Text(
                //           "Order Cancel",
                //           style: TextStyle(
                //               color: Colors.white,
                //               fontSize: 18,
                //               fontWeight: FontWeight.bold),
                //         ),
                //       )),
                // )
              ],
            ),
          );
        });
  }
}
