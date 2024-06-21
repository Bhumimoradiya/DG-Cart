// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'database_services.dart';

// class Authservices {
//   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//   //login
//   Future loginwithusenameandpassword(String email, String password) async {
//     try {
//       var user = (await firebaseAuth.signInWithEmailAndPassword(
//               email: email, password: password)).user!;
//       if (user != null) {
//         await DatabaseService(uid: user.uid).savingUserData(password, email);
//         return true;
//       }
//     } on FirebaseException catch (e) {
//       return e.message;
//     }
//   }

//   //register
//   Future registerUserWithEmailandPassword(
//       String fullName, String email, String password) async {
//     try {
//       UserInfo user = (await firebaseAuth.createUserWithEmailAndPassword(
//           email: email, password: password));
//       if (user != null) {
//         await DatabaseService(uid: user.uid).savingUserData(fullName, email);
//         return true;
//       }
//     } on FirebaseException catch (e) {
//       return e.message;
//     }
//   }
// }
