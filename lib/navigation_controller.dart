import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrubo/pages/booking_history/view/booking_history_view.dart';
import 'package:scrubo/pages/home/view/home_view.dart';
import 'package:scrubo/pages/personalization/settings/settings.dart';
import 'package:scrubo/pages/services/view/services_view.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

class NavigationMenuController extends GetxController {
  static NavigationMenuController instance = Get.find();
  RxInt currentPage = 0.obs;
  int navigationMenuItemsCount = 4;
  void changePage(int index) {
    currentPage.value = index;
  }

  List<Widget> screens = [
    const HomeView(),
    const BookingHistoryView(),
    const ServicesView(),
    const SettingsView()
  ];

  Map<int, Map<String, dynamic>> bottomNavBarItems = {
    0: {
      "iconData": TUiConstants.iconHome,
      "label": "Home",
    },
    1: {
      "iconData": TUiConstants.iconPrevious,
      "label": "Previous",
    },
    2: {
      "iconData": TUiConstants.iconService,
      "label": "Instant",
    },
    3: {
      "iconData": TUiConstants.iconSettings,
      "label": "Settings",
    },
  };
}
