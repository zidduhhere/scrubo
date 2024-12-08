import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrubo/pages/booking_history/view/booking_history_view.dart';
import 'package:scrubo/pages/home/view/home_view.dart';
import 'package:scrubo/pages/personalization/settings/settings.dart';
import 'package:scrubo/pages/services/view/services_view.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    NavigationMenuController navigationMenuController =
        Get.put(NavigationMenuController());
    return Scaffold(
      body: Obx(() => navigationMenuController
          .screens[navigationMenuController.currentPage.value]),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          backgroundColor: Theme.of(context).colorScheme.surface,
          height: TUiConstants.bottomNavigationBarHeight,
          elevation: 3,
          selectedIndex: navigationMenuController.currentPage.value,
          onDestinationSelected: (int index) =>
              navigationMenuController.changePage(index),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          destinations: List.generate(
            navigationMenuController.navigationMenuItemsCount,
            (index) => NavigationDestination(
              icon: Icon(
                navigationMenuController.bottomNavBarItems[index]!["iconData"],
              ),
              label:
                  navigationMenuController.bottomNavBarItems[index]!["label"],
            ),
          ),
        ),
      ),
    );
  }
}

class NavigationMenuController extends GetxController {
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
