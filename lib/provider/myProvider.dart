import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digi_cart_furniture/models/productModel.dart';

class myProvider {
  List<ProductListModel> productListModellist = [];
  late ProductListModel productListModel;
  Future<void> getProductlist() async {
    List<ProductListModel> newproductListModellist = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("productList")
        .doc("3gdGwcPU2ecDN8Tg5u7K")
        .collection('')
        .get();
    querySnapshot.docs.forEach((element) {
      productListModel = ProductListModel(
        name: '',
        price: 1,
        hideprice: 1,
      );
    });
    newproductListModellist.add(productListModel);
    productListModellist = newproductListModellist;
    print(productListModellist);
    log("message${productListModellist}");
  }

  get throwproductListModellist {
    return productListModellist;
  }
}
