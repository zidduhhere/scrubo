import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrubo/pages/authentication/screens/login/widgets/remember_forget_widget.dart';
import 'package:scrubo/pages/authentication/controllers/login/login_controller.dart';
import 'package:scrubo/utils/constants/constants.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/validator/validation.dart';
import 'package:scrubo/utils/widgets/buttons/custom_elevated_button.dart';
import 'package:scrubo/utils/widgets/buttons/custom_outlined_button.dart';
import 'package:scrubo/utils/widgets/textfield/custom_text_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = LoginController.instance;
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          //Email
          CustomTextField(
            textFieldController: controller.emailController,
            validator: TValidation.emailValidator,
            hintText: TTextConstants.emailHint,
            prefixIcon: TUiConstants.iconEmail,
            obscureText: false,
            labelText: TTextConstants.email,
          ),
          const SizedBox(height: TUiConstants.defaultSpacing),
          //Password
          Obx(
            () => CustomTextField(
              textFieldController: controller.passwordController,
              hintText: TTextConstants.passwordHint,
              validator: TValidation.emptyValidator,
              prefixIcon: TUiConstants.iconLock,
              labelText: TTextConstants.password,
              obscureText: controller.obscureState.value,
              onTap: () => controller.obscureState.value =
                  !controller.obscureState.value,
              suffixIcon: controller.obscureState.value
                  ? TUiConstants.iconEyeClose
                  : TUiConstants.iconEyeOpen,
            ),
          ),
          const SizedBox(height: TUiConstants.l),
          //Forgot Password
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const RememberForgetRow(),
              TextButton(
                onPressed: () => controller.forgotPassword(),
                child: Text(
                  TTextConstants.forgotPassword,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              )
            ],
          ),
          const SizedBox(height: TUiConstants.spaceBtwSections),
          CustomElevatedButton(
            text: TTextConstants.login,
            iconData: TUiConstants.iconDirectRight,
            onTap: () => controller.signIn(),
          ),
          const SizedBox(height: TUiConstants.defaultSpacing),
          CustomOutlinedButton(
            onTap: () => Get.toNamed('/signup'),
            text: TTextConstants.signUp,
            iconData: TUiConstants.iconUserAdd,
          )
        ],
      ),
    );
  }
}
