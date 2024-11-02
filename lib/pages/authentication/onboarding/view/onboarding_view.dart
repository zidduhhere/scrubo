import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:scrubo/utils/constants/constants.dart';
import 'package:scrubo/utils/constants/image_strings.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(TImages.logo),
          SizedBox(
            child: Column(
              children: [
                Text(
                  TTextConstants.appName,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: TUiConstants.s),
                Text(
                  TTextConstants.appDescription,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
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
