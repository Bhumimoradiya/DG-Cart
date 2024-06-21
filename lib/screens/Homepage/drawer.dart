import 'package:digi_cart_furniture/component/appcolors.dart';
import 'package:digi_cart_furniture/component/widget.dart';
import 'package:digi_cart_furniture/screens/Authentication/Login/login.dart';
import 'package:digi_cart_furniture/screens/Categories/chairs.dart';
import 'package:digi_cart_furniture/screens/Categories/sofas.dart';
import 'package:digi_cart_furniture/screens/Homepage/mostPopular.dart';
import 'package:digi_cart_furniture/screens/Profile/ProfileField/privacyPolicy.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class drawer extends StatefulWidget {
  const drawer({super.key});
  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  bool isSofaTapped = true;
  bool isChairTapped = true;
  FirebaseStorage storage = FirebaseStorage.instance;
  final user = FirebaseAuth.instance.currentUser;
  Future<String> getDownloadImage() async {
    final imagePath = await storage.ref('profile.jpg').getDownloadURL();
    return imagePath;
  }

  String? path;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    path =
        "https://firebasestorage.googleapis.com/v0/b/dg-furniture-424b2.appspot.com/o/profile.jpg?alt=media&token=730dff54-6534-421d-908b-4772ff9bdbd3";
  }

  @override
  Widget build(BuildContext context) {
    // List<String> title = [
    //   "Sofa's",
    //   "Chair's",
    //   "Most Popular",
    //   "Special Offer",
    //   "Privacy Policy",
    //   "Share App",
    //   "Logout",
    // ];
    // List image = [
    //   "assets/images/drawer_sofa.png",
    //   "assets/images/drawer_Vector (2).png",
    //   "assets/images/drawer_Activity.png",
    //   "assets/images/drawer_Discount.png",
    //   "assets/images/drawer_Shield Done.png",
    //   "assets/images/drawer_share.png",
    //   "assets/images/drawer_power.png",
    // ];
    return Drawer(
      width: 280,
      child: Column(
        children: [
          SizedBox(
            height: 160,
            width: double.infinity,
            child: DrawerHeader(
                padding: EdgeInsets.only(bottom: 10, left: 10),
                decoration: BoxDecoration(color: Appcolors.primarycolor),
                child: InkWell(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FutureBuilder(
                          future: getDownloadImage(),
                          builder: (context, snapshot) {
                            return snapshot.connectionState ==
                                        ConnectionState.waiting ||
                                    !snapshot.hasData
                                ? CircleAvatar(
                                    maxRadius: 37,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      maxRadius: 35,
                                      backgroundColor: Appcolors.primarycolor,
                                    ))
                                : CircleAvatar(
                                    maxRadius: 37,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                        maxRadius: 35,
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
                                  );
                          }),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text.rich(TextSpan(
                              text: "Hello, ",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                              children: [
                                TextSpan(
                                  text: user?.displayName == null
                                      ? "Yogesh Patel"
                                      : "${user?.displayName.toString()}",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                )
                              ])),
                          // Text(
                          //   // 'Hello, Yogesh',
                          //   "Hello,${user!.displayName.toString()}",
                          //   style: TextStyle(fontSize: 17, color: Colors.white),
                          // ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              // 'info123@gmail.com',
                              user?.email == null
                                  ? "sridix@gmail.com"
                                  : "${user?.email.toString()}",
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                drawerdropdownCategorySofa(
                    title: "Sofa's",
                    image: "assets/images/drawer_sofa.png",
                    page: Sofas()),
                SizedBox(
                  height: 12,
                ),
                drawerdropdownCategoryChair(
                    title: "Chair's",
                    image: "assets/images/drawer_Vector (2).png",
                    page: Chairs()),
                SizedBox(
                  height: 12,
                ),
                DrawerCategory(
                    title: "Most Popular",
                    image: "assets/images/drawer_Activity.png",
                    page: MostPopular()),
                DrawerCategory(
                    title: "Special Offer",
                    image: "assets/images/drawer_Discount.png",
                    page: Sofas()),
                DrawerCategory(
                    title: "Privacy Policy",
                    image: "assets/images/drawer_Shield Done.png",
                    page: privacyPolicy()),
                DrawerCategory(
                    title: "Share App",
                    image: "assets/images/drawer_share.png",
                    page: Sofas()),
                LogoutDrawerCategory(
                  title: "Logout",
                  image: "assets/images/drawer_power.png",
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  Widget drawerdropdownCategorySofa({
    required String title,
    required String image,
    required page,
  }) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 7, left: 20, bottom: 0, right: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  nextscreen(context, page);
                },
                child: Row(
                  children: [
                    ImageIcon(
                      AssetImage(image),
                      size: 22,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    setState(() {
                      isSofaTapped = !isSofaTapped;
                    });
                  },
                  icon: isSofaTapped
                      ? Icon(
                          Icons.keyboard_arrow_down,
                          size: 23,
                        )
                      : Icon(
                          Icons.keyboard_arrow_up,
                          size: 23,
                        )),
              // SizedBox(
              //   height: height * 0.05,
              // )
            ],
          ),
        ),
        isSofaTapped
            ? Row()
            : Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 0,
                  color: Colors.grey.shade100,
                  child: Container(
                    height: 80,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 8, left: 15, right: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                minRadius: 24,
                                backgroundColor: Colors.white,
                                child: Image(
                                  image: AssetImage(
                                    "assets/images/drawerpngwing.png",
                                  ),
                                  fit: BoxFit.contain,
                                  height: 22,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  "Slipper",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              CircleAvatar(
                                minRadius: 24,
                                backgroundColor: Colors.white,
                                child: Image(
                                  image: AssetImage(
                                    "assets/images/drawerpngwing (1).png",
                                  ),
                                  fit: BoxFit.cover,
                                  height: 25,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  "Club",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              CircleAvatar(
                                minRadius: 24,
                                backgroundColor: Colors.white,
                                child: Image(
                                  image: AssetImage(
                                    "assets/images/drawerpngwing (2).png",
                                  ),
                                  fit: BoxFit.cover,
                                  height: 36,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  "Bergere",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              CircleAvatar(
                                minRadius: 24,
                                backgroundColor: Colors.white,
                                child: Image(
                                  image: AssetImage(
                                    "assets/images/drawerpngwing (3).png",
                                  ),
                                  fit: BoxFit.cover,
                                  height: 36,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  "Tub",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
      ],
    );
  }

  Widget drawerdropdownCategoryChair({
    required String title,
    required String image,
    required page,
  }) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 7, left: 17, bottom: 0, right: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  nextscreen(context, page);
                },
                child: Row(
                  children: [
                    ImageIcon(
                      AssetImage(image),
                      size: 22,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    setState(() {
                      isChairTapped = !isChairTapped;
                    });
                  },
                  icon: isChairTapped
                      ? Icon(
                          Icons.keyboard_arrow_down,
                          size: 23,
                        )
                      : Icon(
                          Icons.keyboard_arrow_up,
                          size: 23,
                        )),
              // SizedBox(
              //   height: height * 0.05,
              // )
            ],
          ),
        ),
        isChairTapped
            ? Row()
            : Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 0,
                  color: Colors.grey.shade100,
                  child: Container(
                    height: 80,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 8, left: 15, right: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                minRadius: 24,
                                backgroundColor: Colors.white,
                                child: Image(
                                  image: AssetImage(
                                    "assets/images/image_37-removebg-preview.png",
                                  ),
                                  fit: BoxFit.contain,
                                  height: 30,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  "ArmChair",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              CircleAvatar(
                                minRadius: 24,
                                backgroundColor: Colors.white,
                                child: Image(
                                  image: AssetImage(
                                    "assets/images/image_44-removebg-preview.png",
                                  ),
                                  fit: BoxFit.cover,
                                  height: 30,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  "Easy Chairs",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              CircleAvatar(
                                minRadius: 24,
                                backgroundColor: Colors.white,
                                child: Image(
                                  image: AssetImage(
                                    "assets/images/image_50-removebg-preview.png",
                                  ),
                                  fit: BoxFit.cover,
                                  height: 36,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  "Footstools",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              CircleAvatar(
                                minRadius: 24,
                                backgroundColor: Colors.white,
                                child: Image(
                                  image: AssetImage(
                                    "assets/images/image_53-removebg-preview.png",
                                  ),
                                  fit: BoxFit.cover,
                                  height: 30,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  "Altek",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
      ],
    );
  }

  Widget DrawerCategory({
    required String title,
    required String image,
    required page,
  }) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            nextscreen(context, page);
          },
          child: Padding(
            padding:
                const EdgeInsets.only(top: 7, left: 16, bottom: 18, right: 16),
            child: Row(
              children: [
                ImageIcon(
                  AssetImage(image),
                  size: 22,
                  color: Colors.black,
                ),
                SizedBox(
                  width: width * 0.03,
                ),
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: height * 0.05,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget LogoutDrawerCategory({
    required String title,
    required String image,
  }) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            LogOutBottomSheet();
          },
          child: Padding(
            padding:
                const EdgeInsets.only(top: 7, left: 16, bottom: 18, right: 16),
            child: Row(
              children: [
                ImageIcon(
                  AssetImage(image),
                  size: 22,
                  color: Colors.black,
                ),
                SizedBox(
                  width: width * 0.03,
                ),
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: height * 0.05,
                )
              ],
            ),
          ),
        ),
      ],
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
                            onPressed: () {
                              nextscreen(context, login());
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

  Widget ImageWidget({String? image}) {
    return Image(image: NetworkImage(image!));
  }
}
