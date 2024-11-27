import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrubo/pages/authentication/login/view/widgets/remember_forget_widget.dart';
import 'package:scrubo/pages/authentication/login/viewmodel/login_controller.dart';
import 'package:scrubo/utils/constants/constants.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/widgets/custom_elevated_button.dart';
import 'package:scrubo/utils/widgets/custom_outlined_button.dart';
import 'package:scrubo/utils/widgets/custom_text_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.controller,
  });

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          //Email
          CustomTextField(
            textFieldController: controller.emailController,
            controller: controller,
            validator: controller.validator,
            hintText: TTextConstants.emailHint,
            prefixIcon: TUiConstants.iconEmail,
            obscureText: false,
            labelText: TTextConstants.email,
          ),
          const SizedBox(height: TUiConstants.defaultSpacing),
          //Password
          CustomTextField(
            textFieldController: controller.passwordController,
            controller: controller,
            validator: controller.validator,
            hintText: TTextConstants.passwordHint,
            prefixIcon: TUiConstants.iconLock,
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
          const SizedBox(height: TUiConstants.spaceBtwSections),
          CustomElevatedButton(
            text: TTextConstants.login,
            iconData: TUiConstants.iconDirectRight,
            onTap: () {
              controller.login()
                  ? null
                  : Get.snackbar(TTextConstants.loginFailed,
                      TTextConstants.passwordOrEmailIncorrect,
                      snackPosition: SnackPosition.TOP,
                      backgroundColor:
                          Theme.of(context).colorScheme.primaryFixedDim,
                      colorText: Theme.of(context).colorScheme.onPrimaryFixed,
                      icon: Icon(
                        TUiConstants.iconError,
                        color: Theme.of(context).colorScheme.onPrimaryFixed,
                      ));
            },
          ),
          const SizedBox(height: TUiConstants.defaultSpacing),
          CustomOutlinedButton(
            onTap: () {
              controller.signUp();
            },
            text: TTextConstants.signUp,
            iconData: TUiConstants.iconUserAdd,
          )
        ],
      ),
    );
  }
}
