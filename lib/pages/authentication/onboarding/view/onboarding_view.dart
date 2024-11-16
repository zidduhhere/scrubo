import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:scrubo/utils/constants/constants.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
            onTap: () {
              Get.changeThemeMode(
                  Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: TUiConstants.l),
              child: Icon(Get.isDarkMode ? Iconsax.moon : Iconsax.sun_1),
            ),
          ),
        ],
      ),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const FlutterLogo(size: 150),
          const SizedBox(
            height: TUiConstants.defaultSpacing,
          ),
          SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  TTextConstants.appName,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: TUiConstants.s),
                // Text(
                //   TTextConstants.appDescription,
                //   style: Theme.of(context).textTheme.displayMedium,
                // ),
              ],
            ),
          ),
          const SizedBox(
            height: TUiConstants.xxl,
          ),
          IconButton(
            onPressed: () {
              Get.toNamed('/login');
            },
            icon: const Icon(Icons.arrow_forward),
          ),
        ],
      )),
    );
  }
}
