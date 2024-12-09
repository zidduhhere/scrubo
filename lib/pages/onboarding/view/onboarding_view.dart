import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrubo/pages/onboarding/controllers/onboarding_controller.dart';
import 'package:scrubo/utils/constants/constants.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    OnboardingController onboardingController = Get.put(OnboardingController());
    return Scaffold(
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
              ],
            ),
          ),
          const SizedBox(
            height: TUiConstants.xxl,
          ),
          ElevatedButton(
            onPressed: () => onboardingController.onClicked(),
            child: Text(
              'Get Started',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Colors.white,
                  ),
            ),
          )
          // IconButton(
          //   onPressed: () {
          //     Get.toNamed('/login');
          //   },
          //   icon: const Icon(Icons.arrow_forward),
          // ),
        ],
      )),
    );
  }
}
