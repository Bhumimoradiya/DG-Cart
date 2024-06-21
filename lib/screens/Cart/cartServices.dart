import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class CartService {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('cart');

  Future<void> addToCart(String userId, String productId) async {
    await usersCollection
        .doc(userId)
        .collection('products')
        .doc(productId)
        .set({'added': true});
    log("product added to cart");
  }

  Stream<List<String>> getCartProducts(String userId) {
    return usersCollection
        .doc(userId)
        .collection('cart')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.id).toList());
  }
}
