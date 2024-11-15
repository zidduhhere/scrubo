import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:scrubo/utils/constants/image_strings.dart';

class HomeViewController extends GetxController {
  RxInt badgeNumber = 3.obs;
  RxInt carouselIndex = 0.obs;
  String firstPrice = "₹ 250";
  String secondPrice = "₹200";
  RxInt countOfItem = 1.obs;
  RxString hintText = "Search Services".obs;

  void changeHint() {
    while (true) {
      const Duration(seconds: 2);
      hintText.value = "Search Workshops";

      const Duration(seconds: 2);
    }
  }

  bool incrementCount() {
    if (countOfItem.value < 10) {
      countOfItem.value++;
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
      "iconData": Iconsax.car,
      "backgroundColor": const Color(0xFF99CCE6), // Lightest
    },
    1: {
      "title": "Oil Change",
      "iconData": Iconsax.drop3,
      "backgroundColor": const Color(0xFF66B2D9), // Very light
    },
    2: {
      "title": "Repair",
      "iconData": Icons.car_repair_outlined,
      "backgroundColor": const Color(0xFF3399CC), // Light
    },
    3: {
      "title": "Engine",
      "iconData": Iconsax.designtools,
      "backgroundColor": const Color(0xFF0061A3), // Primary
    },
    4: {
      "title": "Inspection",
      "iconData": Iconsax.search_normal,
      "backgroundColor": const Color(0xFF004D82), // Medium dark
    },
    5: {
      "title": "Brake Check",
      "iconData": Iconsax.stop_circle1,
      "backgroundColor": const Color(0xFF003A61), // Dark
    },
    6: {
      "title": "Transmission Check",
      "iconData": Iconsax.omega_circle,
      "backgroundColor": const Color(0xFF002E4D), // Darker
    },
    7: {
      "title": "Battery Check",
      "iconData": Iconsax.battery_charging,
      "backgroundColor": const Color(0xFF00223A), // Darkest
    },
  };

  Map<int, Map<String, String>> items = {
    0: {
      "title": "Full Car Wash",
      "description": "Description 1",
      "offer": "20%",
      "image": TImages.waterRinse,
    },
    1: {
      "title": "Full Car Service",
      "description": "Description 2",
      "offer": "10%",
      "image": TImages.carService,
    },
    2: {
      "title": "Full Car Wash",
      "description": "Description 3",
      "offer": "30%",
      "image": TImages.waterRinse,
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
}
