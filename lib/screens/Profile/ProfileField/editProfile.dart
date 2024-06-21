import 'dart:developer';
import 'dart:io';
import 'package:digi_cart_furniture/component/appcolors.dart';
import 'package:digi_cart_furniture/component/widget.dart';
import 'package:digi_cart_furniture/screens/BottomNavigationBar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../imageWidget.dart';

class editProfile extends StatefulWidget {
  const editProfile({super.key});

  @override
  State<editProfile> createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  File? imageFile;
  ImagePicker picker = ImagePicker();
  bool isPicked = false;
  var size, height, width;
  TextEditingController dateInputController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController FirstnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  FirebaseAuth username = FirebaseAuth.instance;
  Stream<User>? user;
  String name = '';
  String email = '';

  updateInfo({required String name, required String email}) async {
    try {
      User? user = await FirebaseAuth.instance.currentUser;

      // UserCredential userUpdateInfo = updateInfo();

// userUpdateInfo.displayName = 'Ayush';
// userUpdateInfo.photoUrl = '<my photo url>';

      setState(() {
        // user!.updateProfile(displayName: name);
        user?.updateEmail(email);
        user?.updateDisplayName(name);
      });

      nextscreen(
          context,
          bottomNavigationBar(
            myIndex: 4,
          ));
      name == ''
          ? null
          : successSnackbar(context, "Username Updated Successfully");
        // user?.email == 'email-already-in-use'
          // ? errorSnackbar(context, 'The account already exists for that email.')
          // : successSnackbar(context, "Email Updated Successfully");

      log("namee : ${name}");
      log("emaill : ${email}");
      return user;
    }
    // on FirebaseAuthException catch (e) {
    //   if (e == 'email-already-in-use') {
    //     print('The account already exists for that email.');
    //     log("emaillllllllll  ${e}");
    //     errorSnackbar(context, 'The account already exists for that email.');
    //   }
    // }
    catch (e) {
      print(e);
      if (e == 'email-already-in-use') {
        print('The account already exists for that email.');
        log("emaillllllllll  ${e}");
        errorSnackbar(context, 'The account already exists for that email.');
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dateInputController.text = "";
  }

  FirebaseStorage storage = FirebaseStorage.instance;

  Future<String> getDownloadImage() async {
    final imagePath = await storage.ref('profile.jpg').getDownloadURL();
    return imagePath;
  }

  String? selectedValue;
  var gender = [
    "Male",
    "Female",
    "Other",
  ];
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return ScaffoldMessenger(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          // elevation: 0,
          centerTitle: true,
          title: Text(
            "Edit Profile",
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
        body: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification overscroll) {
              overscroll.disallowIndicator();
              return size[0];
            },
            child: SingleChildScrollView(
              // physics: NeverScrollableScrollPhysics(),
              child: Form(
                key: _formkey,
                child: Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Center(
                              child: FutureBuilder(
                                  future: getDownloadImage(),
                                  builder: (context, snapshot) {
                                    return Stack(
                                      children: [
                                        snapshot.connectionState ==
                                                    ConnectionState.waiting ||
                                                !snapshot.hasData
                                            ? CircleAvatar(
                                                maxRadius: 57,
                                                backgroundColor:
                                                    Appcolors.primarycolor,
                                                child: CircleAvatar(
                                                  maxRadius: 55,
                                                  backgroundColor: Colors.white,
                                                ))
                                            : CircleAvatar(
                                                maxRadius: 57,
                                                backgroundColor:
                                                    Appcolors.primarycolor,
                                                child: CircleAvatar(
                                                    maxRadius: 55,
                                                    backgroundColor:
                                                        Colors.white,
                                                    backgroundImage:
                                                        // imageFile != null
                                                        // ?
                                                        // Image.file(
                                                        //     File(widget.imageFile!.path),
                                                        //     fit: BoxFit.cover,
                                                        //   ).image
                                                        // :
                                                        // AssetImage("assets/images/image 19.png")
                                                        NetworkImage(
                                                            snapshot.data!)),
                                              ),
                                        // imageurl == ''
                                        //     ? CircleAvatar(
                                        //         maxRadius: 57,
                                        //         backgroundColor:
                                        //             Appcolors.primarycolor,
                                        //         child: CircleAvatar(
                                        //             backgroundColor:
                                        //                 Appcolors.primarycolor,
                                        //             maxRadius: 55,
                                        //             // backgroundImage: imageurl == ''
                                        //             // ? AssetImage(
                                        //             //         "assets/images/image 19.png")
                                        //             //     :
                                        //             backgroundImage: NetworkImage(
                                        //                 snapshot.data!)),
                                        //       )
                                        //     // isPicked
                                        //     // ? Image.file(
                                        //     //     File(imageFile!.path),
                                        //     //     fit: BoxFit.cover,
                                        //     //   ).image
                                        //     //     : AssetImage(
                                        //     //         "assets/images/image 19.png")
                                        //     : CircleAvatar(
                                        //         maxRadius: 57,
                                        //         backgroundColor:
                                        //             Appcolors.primarycolor,
                                        //         child: CircleAvatar(
                                        //             backgroundColor: Colors.white,
                                        //             maxRadius: 55,
                                        //             // backgroundImage: imageurl == ''
                                        //             //     ? AssetImage(
                                        //             //             "assets/images/image 19.png")
                                        //             //     :
                                        //             backgroundImage:
                                        //                 NetworkImage(imageurl)),
                                        //       ),
                                        Positioned(
                                            // top: height * 0.10,
                                            // left: width * 0.19,
                                            top: 78,
                                            left: 70,
                                            child: CircleAvatar(
                                              maxRadius: 17,
                                              backgroundColor: Colors.white,
                                              child: CircleAvatar(
                                                maxRadius: 15,
                                                backgroundColor:
                                                    Appcolors.primarycolor,
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
                          ),
                          textFormField(
                              title: "Name",
                              type: TextInputType.text,
                              controller: nameController),
                          // textFormField(
                          //     title: "Firstname",
                          //     type: TextInputType.text,
                          //     controller: FirstnameController),
                          DateTextfield(
                              title: 'Date', type: TextInputType.datetime),
                          textFormFieldWithSuffix(
                              title: "Email",
                              type: TextInputType.emailAddress,
                              controller: emailController,
                              iconImage: "assets/images/profile_mail.png"),
                          PhoneTextfieldwithFlag(hinttext: "Phone Number"),
                          GenderDropDown(),
                        ])),
              ),
            )),
        bottomNavigationBar: Container(
          height: 100,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 25, left: 20, right: 20, bottom: 25),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)), backgroundColor: Appcolors.primarycolor,
                    minimumSize: Size(300, 50)),
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    setState(() {
                      name = nameController.text;
                      email = emailController.text;
                      name == '' && email == ''
                          ? null
                          : updateInfo(name: name, email: email);
                    });
                    // Navigator.of(context).pop();
                  }
                  // nextscreen(
                  //     context,
                  //     bottomNavigationBar(
                  //       myIndex: 4,
                  //     ));
                },
                child: Center(
                  child: Text(
                    "Update",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                )),
          ),
        ),
      ),
    );
  }

  Widget GenderDropDown() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 10),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          hint: Text("Gender"),
          isExpanded: true,
          items: gender
              .map((String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 16,
                        // fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ))
              .toList(),
          value: selectedValue,
          onChanged: (String? value) {
            setState(() {
              selectedValue = value;
            });
          },
          buttonStyleData: ButtonStyleData(
            height: 55,
            width: width,
            padding: const EdgeInsets.only(left: 14, right: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: Colors.transparent)],
              color: Colors.grey.shade100,
            ),
            elevation: 12,
          ),
          iconStyleData: const IconStyleData(
            icon: ImageIcon(
              AssetImage("assets/images/Arrow - Down 2.png"),
              // size: 23,
              color: Colors.black,
            ),
            iconSize: 20,
            iconEnabledColor: Colors.black,
            iconDisabledColor: Colors.grey,
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 120,
            padding: EdgeInsets.only(left: 20),
            width: 120,
            isFullScreen: true,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Colors.white,
            ),
            offset: const Offset(190, -100),
            scrollbarTheme: ScrollbarThemeData(
              mainAxisMargin: 5,
              crossAxisMargin: 10,
              radius: const Radius.circular(40),
              thickness: MaterialStateProperty.all<double>(6),
              thumbVisibility: MaterialStateProperty.all<bool>(true),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
            padding: EdgeInsets.only(left: 14, right: 14),
          ),
        ),
      ),
    );
  }

  Widget PhoneTextfieldwithFlag({
    required String hinttext,
  }) {
    return Padding(
        padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 2, left: 15, right: 15, bottom: 6),
              child: IntlPhoneField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: hinttext,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(14),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                dropdownIcon: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.black,
                ),
                // dropdownIconPosition: IconPosition,

                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                ],
                disableLengthCheck: true,
                dropdownIconPosition: IconPosition.trailing,
                initialCountryCode: 'IN',
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
              ),
            )));
  }

  Widget DateTextfield({
    required String title,
    required TextInputType type,
  }) {
    return Padding(
        padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 2, left: 15, right: 5, bottom: 6),
            child: TextFormField(
              controller: dateInputController,
              keyboardType: type,
              style: TextStyle(
                color: Colors.black54,
                // fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              cursorColor: Colors.grey.shade400,
              readOnly: true,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: title,
                  hintStyle: TextStyle(
                    color: Colors.black54,
                    // fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  suffixIcon: IconButton(
                      onPressed: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950, 1, 1),
                          lastDate: DateTime(2200, 12, 31),
                          builder: (context, child) {
                            return Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: ColorScheme.light(
                                    primary:
                                        Appcolors.primarycolor, // <-- SEE HERE
                                    onPrimary: Colors.white, // <-- SEE HERE
                                    onSurface: Colors.black, // <-- SEE HERE
                                  ),
                                  textButtonTheme: TextButtonThemeData(
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.black, // button text color
                                    ),
                                  ),
                                ),
                                child: child!);
                          },
                        );

                        if (pickedDate != null) {
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          setState(() {
                            dateInputController.text = formattedDate;
                          });
                        }
                      },
                      icon: ImageIcon(
                        AssetImage("assets/images/Calendar.png"),
                        size: 23,
                        color: Colors.black,
                      ))),
            ),
          ),
        ));
  }

  Widget textFormField(
      {required String title,
      required TextInputType type,
      required TextEditingController controller}) {
    return Padding(
        padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 2, left: 15, right: 15, bottom: 6),
            child: TextFormField(
              controller: controller,
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
              keyboardType: type,
              style: TextStyle(
                color: Colors.black54,
                // fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              cursorColor: Colors.grey.shade400,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                enabledBorder: InputBorder.none,
                hintText: title,
                focusedBorder: InputBorder.none,
                hintStyle: TextStyle(
                  color: Colors.black54,
                  // fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ));
  }

  Widget textFormFieldWithSuffix({
    required String title,
    required TextInputType type,
    required String iconImage,
    required TextEditingController controller,
  }) {
    return Padding(
        padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 2, left: 15, right: 5, bottom: 6),
            child: TextFormField(
              keyboardType: type,
              controller: controller,
              style: TextStyle(
                color: Colors.black54,
                // fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
              cursorColor: Colors.grey.shade400,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  enabledBorder: InputBorder.none,
                  hintText: title,
                  focusedBorder: InputBorder.none,
                  hintStyle: TextStyle(
                    color: Colors.black54,
                    // fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  suffixIcon: IconButton(
                      onPressed: () {},
                      icon: ImageIcon(
                        AssetImage(iconImage),
                        size: 23,
                        color: Colors.black,
                      ))),
            ),
          ),
        ));
  }

  // _getFromGallery() async {
  //   XFile? pickedFile = await ImagePicker().pickImage(
  //     source: ImageSource.gallery,
  //     maxWidth: 1800,
  //     maxHeight: 1800,
  //   );
  //   if (pickedFile != null) {
  //     setState(() {
  //       File imagefile = File(pickedFile.path);
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
      return downloadurl;
    } else {
      // ScaffoldMessenger.of(context)
      //     .showSnackBar(SnackBar(content: Text("Permission")));
    }
    return null;
  }

  /// Get from Camera
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
