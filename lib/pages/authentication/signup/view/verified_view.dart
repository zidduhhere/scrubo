import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrubo/pages/authentication/signup/viewmodel/signup_controller.dart';
import 'package:scrubo/utils/constants/constants.dart';
import 'package:scrubo/utils/constants/image_strings.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/widgets/custom_elevated_button.dart';

class VerifiedView extends StatelessWidget {
  const VerifiedView({super.key});

  @override
  Widget build(BuildContext context) {
    SignupController signupController = Get.find<SignupController>();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: TSpacingStyles.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                TImages.verified,
                scale: 7,
              ),
              const SizedBox(height: TUiConstants.spaceBtwSections),
              Text(TTextConstants.accountCreatedSuccessfully,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: TUiConstants.defaultSpacing),
              Text(
                TTextConstants.welcomeDescription,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      height: 1.5,
                      fontWeight: FontWeight.w500,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TUiConstants.spaceBtwSections),
              CustomElevatedButton(
                onTap: () => signupController.homeWithSignup(),
                // Get.toNamed('/login');

                text: TTextConstants.continueButton,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
