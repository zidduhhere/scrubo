import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:scrubo/utils/constants/colors.dart';
import 'package:scrubo/utils/constants/image_strings.dart';

class HomeViewController extends GetxController {
  RxInt badgeNumber = 3.obs;
  RxInt carouselIndex = 0.obs;
  String firstPrice = "250";
  String secondPrice = "200";
  RxInt countOfItem = 1.obs;

  int prevoisPrice(int price, int discount) {
    int prevPrice = (price - (price * discount / 100)).toInt();
    return prevPrice;
  }

  bool incrementCount() {
    if (badgeNumber.value < 10) {
      // countOfItem.value++;
      badgeNumber.value++;
      return true;
    } else {
      return false;
    }
  }

  void changeCarouselIndex(int index) {
    carouselIndex.value = index;
  }

  Map<int, Map<String, dynamic>> categories = {
    0: {
      "title": "Wash",
      "icon": TImages.colorIconCarWash,
      "backgroundColor": const Color(0xFF99CCE6), // Lightest
      "backgroundColorDark": TColors.darkPrimary
    },
    1: {
      "title": "Oil Change",
      "icon": TImages.colorIconOilChange,
      "backgroundColor": const Color(0xFF66B2D9), // Very light
    },
    2: {
      "title": "Repair",
      "icon": TImages.colorIconRepair,
      "backgroundColor": const Color(0xFF3399CC), // Light
    },
    3: {
      "title": "Engine",
      "icon": TImages.colorIconCarService,
      "backgroundColor": const Color(0xFF0061A3), // Primary
    },
    4: {
      "title": "Inspection",
      "icon": TImages.colorIconSpareParts,
      "backgroundColor": const Color(0xFF004D82), // Medium dark
    },
    5: {
      "title": "Brake Check",
      "icon": TImages.colorIconBreakCheck,
      "backgroundColor": const Color(0xFF003A61), // Dark
    },
    6: {
      "title": "Transmission Check",
      "icon": TImages.colorIconCarService,
      "backgroundColor": const Color(0xFF002E4D), // Darker
    },
    7: {
      "title": "Battery Check",
      "icon": TImages.colorIconSpareParts,
      "backgroundColor": const Color(0xFF00223A), // Darkest
    },
  };

  Map<int, Map<String, String>> items = {
    0: {
      "title": "Use code 'WELCOME20'",
      "description": "Can avail on any services",
      "offer": "20%",
      "image": TImages.confetti,
    },
    1: {
      "title": "Avail using code 'SUSPENSION30'",
      "description": "On buying new car suspension",
      "offer": "30%",
      "image": TImages.suspensionCar,
    },
    2: {
      "title": "Use code 'CARSPA10'",
      "description": "On booking car spa",
      "offer": "10%",
      "image": TImages.carSpa,
    },
    3: {
      "title": "Use code 'TYRES300'",
      "description": "Buy 4 get 1 free",
      "image": TImages.tyresCar,
    },
  };

  Map<int, Map<String, dynamic>> serviceDetails = {
    0: {
      "title": "Full Car Wash",
      "subtitle": "Description 1",
      "icon": Iconsax.activity,
    },
    1: {
      "title": "Full Car Service",
      "subtitle": "Description 2",
      "icon": Iconsax.activity,
    },
    2: {
      "title": "Full Wash",
      "subtitle": "Description 3",
      "icon": Iconsax.activity,
    },
    3: {
      "title": "Full Detailing",
      "subtitle": "Description 4",
      "icon": Iconsax.activity,
    },
    4: {
      "title": "Full Inspection",
      "subtitle": "Description 5",
      "icon": Iconsax.activity,
    },
    5: {
      "title": "Tire Change",
      "subtitle": "Description 6",
      "icon": Iconsax.activity,
    },
    6: {
      "title": "Oil Change",
      "subtitle": "Description 7",
      "icon": Iconsax.activity,
    },
    7: {
      "title": "Battery Check",
      "subtitle": "Description 8",
      "icon": Iconsax.activity,
    },
  };

  Map<int, Map<String, dynamic>> productGridItems = {
    0: {
      "title": "Battery Buy",
      "price": 250,
      "imageUrl": TImages.batteryCar,
      "isNetworkImage": false,
      "shopAddress": "Shop 1, 2nd Floor, 3rd Building",
      "discount": 10,
    },
    1: {
      "title": "Car Wash",
      "price": 560,
      "imageUrl": TImages.carWashService,
      "isNetworkImage": false,
      "shopAddress": "Shop 1, 2nd Floor, 3rd Building",
      "discount": 20,
    },
    2: {
      "title": "Oil Change",
      "price": 250,
      "imageUrl": TImages.carOilChange,
      "isNetworkImage": false,
      "shopAddress": "Shop 1, 2nd Floor, 3rd Building",
      "discount": 10,
    },
    3: {
      "title": "Tire Service",
      "price": 2500,
      "imageUrl": TImages.tyresCar,
      "isNetworkImage": false,
      "shopAddress": "Shop 1, 2nd Floor, 3rd Building",
      "discount": 10,
    },
  };
}
