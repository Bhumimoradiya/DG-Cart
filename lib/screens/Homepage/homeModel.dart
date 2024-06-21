import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
    final int status;
    final int count;
    final String message;
    final List<List<Datum>> data;

    HomeModel({
        required this.status,
        required this.count,
        required this.message,
        required this.data,
    });

    factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        status: json["STATUS"],
        count: json["COUNT"],
        message: json["MESSAGE"],
        data: List<List<Datum>>.from(json["DATA"].map((x) => List<Datum>.from(x.map((x) => Datum.fromJson(x))))),
    );

    Map<String, dynamic> toJson() => {
        "STATUS": status,
        "COUNT": count,
        "MESSAGE": message,
        "DATA": List<dynamic>.from(data.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
    };
}

class Datum {
    final String name;
    final String label;
    final int mobileSeqNo;
    final int desktopSeqNo;
    final List<DatumElement> data;
    final String type;

    Datum({
        required this.name,
        required this.label,
        required this.mobileSeqNo,
        required this.desktopSeqNo,
        required this.data,
        required this.type,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        label: json["label"],
        mobileSeqNo: json["mobile_seq_no"],
        desktopSeqNo: json["desktop_seq_no"],
        data: List<DatumElement>.from(json["data"].map((x) => DatumElement.fromJson(x))),
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "label": label,
        "mobile_seq_no": mobileSeqNo,
        "desktop_seq_no": desktopSeqNo,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "type": type,
    };
}

class DatumElement {
    final int id;
    final String sliderId;
    final String sliderName;
    final String sliderImage;
    final dynamic key;
    final dynamic value;
    final int categoryId;
    final String categoryName;
    final String categoryImage;
    final String categoryBanner;
    final int categorySeqNo;
    final String name;
    final int productId;
    final String productName;
    final String aboutItem;
    final dynamic productSlug;
    final int productMrp;
    final int productPrice;
    final String productImage;
    final dynamic productDiscount;
    final int isLinkImage;
    final dynamic productRating;
    final int totalReview;
    final dynamic inWishlist;
    final dynamic inCart;
    final dynamic inCompare;
    final int isShowSaleTag;
    final Currency currency;
    final int currencyPosition;
    final ProductReview productReview;

    DatumElement({
        required this.id,
        required this.sliderId,
        required this.sliderName,
        required this.sliderImage,
        required this.key,
        required this.value,
        required this.categoryId,
        required this.categoryName,
        required this.categoryImage,
        required this.categoryBanner,
        required this.categorySeqNo,
        required this.name,
        required this.productId,
        required this.productName,
        required this.aboutItem,
        required this.productSlug,
        required this.productMrp,
        required this.productPrice,
        required this.productImage,
        required this.productDiscount,
        required this.isLinkImage,
        required this.productRating,
        required this.totalReview,
        required this.inWishlist,
        required this.inCart,
        required this.inCompare,
        required this.isShowSaleTag,
        required this.currency,
        required this.currencyPosition,
        required this.productReview,
    });

    factory DatumElement.fromJson(Map<String, dynamic> json) => DatumElement(
        id: json["id"],
        sliderId: json["slider_id"],
        sliderName: json["slider_name"],
        sliderImage: json["slider_image"],
        key: json["key"],
        value: json["value"],
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        categoryImage: json["category_image"],
        categoryBanner: json["category_banner"],
        categorySeqNo: json["category_seq_no"],
        name: json["name"],
        productId: json["product_id"],
        productName: json["product_name"],
        aboutItem: json["about_item"],
        productSlug: json["product_slug"],
        productMrp: json["product_mrp"],
        productPrice: json["product_price"],
        productImage: json["product_image"],
        productDiscount: json["product_discount"],
        isLinkImage: json["is_link_image"],
        productRating: json["product_rating"],
        totalReview: json["total_review"],
        inWishlist: json["in_wishlist"],
        inCart: json["in_cart"],
        inCompare: json["in_compare"],
        isShowSaleTag: json["is_show_sale_tag"],
        currency: currencyValues.map[json["currency"]]!,
        currencyPosition: json["currency_position"],
        productReview: productReviewValues.map[json["product_review"]]!,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "slider_id": sliderId,
        "slider_name": sliderName,
        "slider_image": sliderImage,
        "key": key,
        "value": value,
        "category_id": categoryId,
        "category_name": categoryName,
        "category_image": categoryImage,
        "category_banner": categoryBanner,
        "category_seq_no": categorySeqNo,
        "name": name,
        "product_id": productId,
        "product_name": productName,
        "about_item": aboutItem,
        "product_slug": productSlug,
        "product_mrp": productMrp,
        "product_price": productPrice,
        "product_image": productImage,
        "product_discount": productDiscount,
        "is_link_image": isLinkImage,
        "product_rating": productRating,
        "total_review": totalReview,
        "in_wishlist": inWishlist,
        "in_cart": inCart,
        "in_compare": inCompare,
        "is_show_sale_tag": isShowSaleTag,
        "currency": currencyValues.reverse[currency],
        "currency_position": currencyPosition,
        "product_review": productReviewValues.reverse[productReview],
    };
}

enum Currency {
    EMPTY
}

final currencyValues = EnumValues({
    "₹": Currency.EMPTY
});

enum ProductReview {
    EMPTY,
    THE_1_REVIEWS
}

final productReviewValues = EnumValues({
    "": ProductReview.EMPTY,
    "(1 Reviews)": ProductReview.THE_1_REVIEWS
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
