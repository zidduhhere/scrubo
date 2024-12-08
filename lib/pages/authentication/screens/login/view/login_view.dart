import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:scrubo/utils/widgets/custom/custom_divider.dart';
import 'package:scrubo/pages/authentication/login/view/widgets/login_form.dart';
import 'package:scrubo/pages/authentication/login/view/widgets/login_header.dart';
import 'package:scrubo/pages/authentication/login/viewmodel/login_controller.dart';
import 'package:scrubo/utils/constants/constants.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/device/device_utility.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());
    // TDeviceUtility.setStatusBarColor(Colors.transparent);
    return GestureDetector(
      onTap: () {
        TDeviceUtility.hideKeyboard(context);
      },
      child: Scaffold(
          body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyles.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    controller.toggleTheme();
                  },
                  child: Obx(
                    () => Icon(
                      controller.isDarkMode.value
                          ? Iconsax.moon
                          : Iconsax.sun_1,
                    ),
                  ),
                ),
              ),

              ///Header
              const LoginHeader(),

              //Form
              const SizedBox(height: TUiConstants.spaceBtwSections),
              LoginForm(controller: controller),
              const SizedBox(height: TUiConstants.spaceBtwSections),
              TFormDivider(text: TTextConstants.signInwith.toUpperCase()),
              const SizedBox(height: TUiConstants.defaultSpacing),
            ],
          ),
        ),
      )),
    );
  }
}
