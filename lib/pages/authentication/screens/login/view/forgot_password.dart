import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrubo/pages/authentication/controllers/login/login_controller.dart';
import 'package:scrubo/utils/constants/constants.dart';
import 'package:scrubo/utils/constants/image_strings.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/widgets/buttons/custom_elevated_button.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = LoginController.instance;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.offAllNamed('/login'),
            icon: const Icon(Icons.close),
          )
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
                'Password reset email is sent to your email',
                style: Theme.of(context).textTheme.titleLarge,
                maxLines: 2,
              ),
              const SizedBox(height: TUiConstants.defaultSpacing),
              Text(email ?? '',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                      )),
              const SizedBox(height: TUiConstants.defaultSpacing),
              Text(
                  'Please check your email for the password reset link, there you can reset the password',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith()),

              //Buttons

              const SizedBox(height: TUiConstants.spaceBtwSections),
              CustomElevatedButton(
                  onTap: () => Get.offAllNamed('/login'),
                  text: TTextConstants.continueButton),
              const SizedBox(height: TUiConstants.defaultSpacing),
              TextButton(
                  onPressed: () => controller.forgotPassword(resend: true),
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
