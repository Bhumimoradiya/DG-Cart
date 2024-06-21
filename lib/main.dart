// @dart=2.19
import 'package:digi_cart_furniture/component/appcolors.dart';
import 'package:digi_cart_furniture/helper/helper_function.dart';
import 'package:digi_cart_furniture/screens/Authentication/emailVerified.dart';
import 'package:digi_cart_furniture/screens/BottomNavigationBar.dart';
import 'package:digi_cart_furniture/screens/splashscreen/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await helperfunction.getuserloggedinstatus().then((value) {
    if (value != null) {
      issignedin = value;
    }
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Color(0xFFFFAB40), // status bar color
        statusBarIconBrightness: Brightness.dark));
    runApp(const MyApp());
  });
}
// void main() {
//   SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//       statusBarColor: Color(0xFFFFAB40), // status bar color
//       statusBarIconBrightness: Brightness.dark));
//   runApp(const MyApp());
//   // SystemChrome.setEnabledSystemUIOverlays([]);
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // systemOverlayStyle:
    // const SystemUiOverlayStyle(
    //   statusBarColor: Colors.green,
    //   // statusBarIconBrightness: Brightness.dark,
    // );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
            cursorColor: Appcolors.primarycolor.withOpacity(0.55),
            selectionHandleColor: Appcolors.primarycolor,
            selectionColor: Appcolors.primarycolor.withOpacity(0.55)),
        scaffoldBackgroundColor: Appcolors.primarycolor,
      ),
      home: splashScreen(),
      // home: MainApp(),
      // home: Auth(),
      // home: Homepage(),
      // home: bottomNavigationBar(myIndex: 0),
      // home: DropDown(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext co1ntext) {
    return StreamBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return EmailVerified();
        } else {
          return splashScreen();
        }
      },
      stream: null,
    );
  }
}
