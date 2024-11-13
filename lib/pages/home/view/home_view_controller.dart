import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class HomeViewController extends GetxController {
  RxInt badgeNumber = 3.obs;
  Rx<CarouselSliderController> carouselController =
      CarouselSliderController().obs;

  Map<int, Map<String, dynamic>> categories = {
    0: {
      "title": "Wash",
      "iconData": Iconsax.car,
      "backgroundColor": const Color(0xFFAEC6CF)
    },
    1: {
      "title": "Service",
      "iconData": Iconsax.card1,
      "backgroundColor": const Color(0xFF77DD77)
    },
    2: {
      "title": "Repair",
      "iconData": Icons.car_repair_outlined,
      "backgroundColor": const Color(0xFFFDFD96)
    },
    3: {
      "title": "Detailing",
      "iconData": Iconsax.designtools,
      "backgroundColor": const Color(0xFFFFB7B2)
    },
    4: {
      "title": "Inspection",
      "iconData": Iconsax.search_normal,
      "backgroundColor": const Color(0xFFB39DDB)
    },
    5: {
      "title": "Tire Change",
      "iconData": Iconsax.calculator1,
      "backgroundColor": const Color(0xFF90CAF9)
    },
    6: {
      "title": "Oil Change",
      "iconData": Iconsax.omega_circle,
      "backgroundColor": const Color(0xFFFFCC80)
    },
    7: {
      "title": "Battery Check",
      "iconData": Iconsax.add1,
      "backgroundColor": const Color(0xFFA5D6A7)
    },
  };

  Map<int, Map<String, String>> items = {
    0: {
      "title": "Full Car Wash",
      "description": "Description 1",
      "offer": "20%",
      "image": "assets/images/water-rinse.png",
    },
    1: {
      "title": "Full Car Service",
      "description": "Description 2",
      "offer": "10%",
      "image": "assets/images/car-service.png",
    },
    2: {
      "title": "Full Car Wash",
      "description": "Description 3",
      "offer": "30%",
      "image": "assets/images/water-rinse.png",
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
