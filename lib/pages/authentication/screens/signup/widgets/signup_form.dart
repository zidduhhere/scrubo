import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:scrubo/pages/authentication/controllers/signup/signup_controller.dart';
import 'package:scrubo/utils/constants/constants.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/validator/validation.dart';
import 'package:scrubo/utils/widgets/textfield/custom_text_field.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SignupController signupController = SignupController.instance;
    return Form(
      key: signupController.formKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                    textFieldController: signupController.firstNameController,
                    validator: TValidation.firstNameValidator,
                    hintText: TTextConstants.firstNameHint,
                    prefixIcon: Iconsax.user,
                    labelText: TTextConstants.firstName,
                    obscureText: false),
              ),
              const SizedBox(width: TUiConstants.defaultSpacing),
              Expanded(
                child: CustomTextField(
                    textFieldController: signupController.lastNameController,
                    validator: TValidation.lastNameValidator,
                    hintText: TTextConstants.lastNameHint,
                    prefixIcon: Iconsax.user,
                    labelText: TTextConstants.lastName,
                    obscureText: false),
              ),
            ],
          ),
          const SizedBox(height: TUiConstants.spaceBtwInputFields),
          CustomTextField(
              enabled: false,
              textFieldController: signupController.userNameController.value,
              // validator: TValidation.usernameValidator,
              hintText: TTextConstants.usernameHint,
              prefixIcon: Iconsax.user_edit,
              labelText: TTextConstants.username,
              keyboardType: TextInputType.text,
              obscureText: false),
          const SizedBox(height: TUiConstants.spaceBtwInputFields),
          CustomTextField(
              textFieldController: signupController.emailController,
              validator: TValidation.emailValidator,
              hintText: TTextConstants.emailHint,
              prefixIcon: Icons.email_outlined,
              labelText: TTextConstants.email,
              keyboardType: TextInputType.emailAddress,
              obscureText: false),

          const SizedBox(height: TUiConstants.spaceBtwInputFields),
          CustomTextField(
              textFieldController: signupController.phoneController,
              validator: TValidation.phoneValidator,
              hintText: TTextConstants.phoneNumberHint,
              prefixIcon: Iconsax.call,
              labelText: TTextConstants.phoneNumber,
              keyboardType: TextInputType.phone,
              obscureText: false),
          const SizedBox(height: TUiConstants.spaceBtwInputFields),
          Obx(
            () => CustomTextField(
              textFieldController: signupController.passwordController,
              obscureText: signupController.obscureState.value,
              suffixIcon: signupController.obscureState.value
                  ? Iconsax.eye_slash
                  : Iconsax.eye,
              onTap: () => signupController.obscureState.value =
                  !signupController.obscureState.value,
              validator: TValidation.passwordValidator,
              hintText: TTextConstants.passwordHint,
              keyboardType: TextInputType.visiblePassword,
              prefixIcon: Iconsax.lock,
              labelText: TTextConstants.password,
            ),
          ), // Only this field has obscureText: true
        ],
      ),
    );
  }
}
