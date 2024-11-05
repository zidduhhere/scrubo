import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrubo/pages/authentication/signup/viewmodel/signup_controller.dart';
import 'package:scrubo/utils/constants/constants.dart';
import 'package:scrubo/utils/constants/image_strings.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/widgets/custom_elevated_button.dart';

class VerifyView extends StatelessWidget {
  const VerifyView({super.key});

  @override
  Widget build(BuildContext context) {
    SignupController signupController = Get.find<SignupController>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.close))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TUiConstants.defaultSpacing),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(TImages.verification),
              //Title
              // const SizedBox(height: TUiConstants.defaultSpacing),
              Text(
                TTextConstants.verifyEmail,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: TUiConstants.defaultSpacing),
              Text(signupController.emailController.value.text,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                      )),
              const SizedBox(height: TUiConstants.defaultSpacing),
              Text(TTextConstants.verifyEmailDescription,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith()),

              //Buttons

              const SizedBox(height: TUiConstants.spaceBtwSections),
              CustomElevatedButton(
                  onTap: () => signupController.emailVerifyContinue(),
                  text: TTextConstants.continueButton),
              const SizedBox(height: TUiConstants.defaultSpacing),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    TTextConstants.resendCode,
                    style: Theme.of(context).textTheme.labelMedium,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
