import 'package:cloud_firestore/cloud_firestore.dart';

class CarouselModel {
  final bool active;
  String image;
  final String targetScreen;
  final int? discount;
  final String? couponCode;
  final String description;
  final String? shop;

  CarouselModel({
    required this.active,
    required this.image,
    required this.targetScreen,
    this.discount,
    this.couponCode,
    this.shop,
    required this.description,
  });

  static CarouselModel fromSnapshopt(
      DocumentSnapshot<Map<String, dynamic>> document) {
    {
      if (document.data() != null) {
        return CarouselModel(
          active: document["active"],
          image: document["image"],
          targetScreen: document["targetScreen"],
          description: document["description"],
          couponCode: document["couponCode"] ?? '',
          shop: document["shop"] ?? '',
          discount: document["discount"] ?? '',
        );
      } else {
        return CarouselModel.empty;
      }
    }
  }

  static CarouselModel get empty => CarouselModel(
      active: false,
      image: '',
      targetScreen: '',
      description: '',
      couponCode: '',
      discount: 0,
      shop: '');

  Map<String, dynamic> toJson() {
    return {
      "active": active,
      "image": image,
      "targetScreen": targetScreen,
      "description": description,
      "couponCode": couponCode,
      "discount": discount,
      "shop": shop
    };
  }
}
