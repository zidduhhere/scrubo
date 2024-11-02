import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:scrubo/pages/authentication/login/view/widgets/remember_forget_widget.dart';
import 'package:scrubo/pages/authentication/login/viewmodel/login_controller.dart';
import 'package:scrubo/utils/constants/constants.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/device/device_utility.dart';
import 'package:scrubo/utils/helpers/helper_functions.dart';
import 'package:scrubo/utils/widgets/custom_elevated_button.dart';
import 'package:scrubo/utils/widgets/custom_outlined_button.dart';
import 'package:scrubo/utils/widgets/custom_text_field.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());
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
                  child: Icon(
                    controller.isDarkMode.value ? Iconsax.moon : Iconsax.sun_1,
                  ),
                ),
              ),

              ///Header

              const FlutterLogo(size: 150),
              const SizedBox(height: TUiConstants.defaultSpacing),
              Text(
                TTextConstants.welcomeBack,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: TUiConstants.s),
              SizedBox(
                width: THelperFunctions.getDeviceWidth(context) * .8,
                child: Text(
                  TTextConstants.loginDescription,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),

              //Form
              const SizedBox(
                height: TUiConstants.xxl * 1.5,
              ),
              Form(
                child: Column(
                  children: [
                    //Email
                    CustomTextField(
                      textFieldController: controller.emailController,
                      controller: controller,
                      validator: controller.validator,
                      hintText: TTextConstants.emailHint,
                      prefixIcon: Icons.email_outlined,
                      labelText: TTextConstants.email,
                    ),
                    const SizedBox(height: TUiConstants.defaultSpacing),
                    //Password
                    CustomTextField(
                      textFieldController: controller.passwordController,
                      controller: controller,
                      validator: controller.validator,
                      hintText: TTextConstants.passwordHint,
                      prefixIcon: Iconsax.lock,
                      labelText: TTextConstants.password,
                      suffixIcon: true,
                    ),
                    const SizedBox(height: TUiConstants.l),
                    //Forgot Password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const RememberForgetRow(),
                        Text(TTextConstants.forgotPassword,
                            style: Theme.of(context).textTheme.labelSmall)
                      ],
                    ),
                    const SizedBox(height: TUiConstants.defaultSpacing),
                    CustomElevatedButton(
                      iconData: Iconsax.direct_right,
                      onTap: () {
                        controller.login();
                      },
                    ),
                    const SizedBox(height: TUiConstants.defaultSpacing),
                    const CustomOutlinedButton(
                      text: TTextConstants.signUp,
                      iconData: Iconsax.user_add,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
