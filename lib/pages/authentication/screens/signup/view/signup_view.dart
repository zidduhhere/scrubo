import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:scrubo/utils/widgets/custom/custom_divider.dart';
import 'package:scrubo/pages/authentication/signup/view/widgets/signup_form.dart';
import 'package:scrubo/pages/authentication/signup/view/widgets/terms_and_conditions.dart';
import 'package:scrubo/pages/authentication/signup/view/widgets/theme_toggle_icon_btn.dart';
import 'package:scrubo/pages/authentication/signup/viewmodel/signup_controller.dart';
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
      appBar: AppBar(
        actions: const [ThemeToggleIconButton()],
      ),
      body: GestureDetector(
        onTap: () => TDeviceUtility.hideKeyboard(context),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TUiConstants.defaultSpacing),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Title
                Text(
                  TTextConstants.signUp,
                  style: Theme.of(context).textTheme.headlineMedium,
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
                      controller.createAccount();
                    },
                  ),
                ),
                const SizedBox(height: TUiConstants.spaceBtwSections),

                TFormDivider(text: TTextConstants.signInwith.toUpperCase())
              ],
            ),
          ),
        ),
      ),
    );
  }
}