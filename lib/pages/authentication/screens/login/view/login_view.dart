import 'package:flutter/material.dart';
import 'package:scrubo/utils/widgets/custom/custom_divider.dart';
import 'package:scrubo/pages/authentication/screens/login/widgets/login_form.dart';
import 'package:scrubo/pages/authentication/screens/login/widgets/login_header.dart';
import 'package:scrubo/pages/authentication/controllers/login/login_controller.dart';
import 'package:scrubo/utils/constants/constants.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/device/device_utility.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    //ignore_for_file: unused_local_variable
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
              ///Header
              const LoginHeader(),

              //Form
              const SizedBox(height: TUiConstants.spaceBtwSections),
              const LoginForm(),
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
