import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:scrubo/pages/authentication/screens/signup/widgets/signup_form.dart';
import 'package:scrubo/pages/authentication/screens/signup/widgets/terms_and_conditions.dart';
import 'package:scrubo/pages/authentication/controllers/signup/signup_controller.dart';
import 'package:scrubo/utils/constants/constants.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/device/device_utility.dart';
import 'package:scrubo/utils/widgets/buttons/custom_elevated_button.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    SignupController controller = Get.put(SignupController());
    return Scaffold(
      //Appbar

      body: GestureDetector(
        onTap: () => TDeviceUtility.hideKeyboard(context),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(TUiConstants.defaultSpacing),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () => Get.back(),
                          icon: const Icon(TUiConstants.iconBack)),
                      Text(
                        TTextConstants.signUp,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: TUiConstants.spaceBtwSections),
                  //Form
                  const SignupForm(),
                  //Terms and conditions
                  const SizedBox(height: TUiConstants.spaceBtwSections),

                  const TermsAndConditionsWidget(),

                  const SizedBox(height: TUiConstants.spaceBtwSections),

                  Center(
                    child: CustomElevatedButton(
                      iconData: Iconsax.user_add,
                      text: TTextConstants.signUp,
                      onTap: () {
                        controller.signUp();
                      },
                    ),
                  ),
                  const SizedBox(height: TUiConstants.spaceBtwSections),

                  // TFormDivider(text: TTextConstants.signInwith.toUpperCase())
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
