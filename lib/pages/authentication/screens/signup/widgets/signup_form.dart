import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:scrubo/pages/authentication/signup/viewmodel/signup_controller.dart';
import 'package:scrubo/utils/constants/constants.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/widgets/textfield/custom_text_field.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SignupController signupController = Get.find<SignupController>();

    return Form(
      key: signupController.formKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                    textFieldController: signupController.firstNameController,
                    validator: signupController.firstNameValidator,
                    hintText: TTextConstants.firstNameHint,
                    prefixIcon: Iconsax.user,
                    labelText: TTextConstants.firstName,
                    controller: signupController,
                    obscureText: false),
              ),
              const SizedBox(width: TUiConstants.defaultSpacing),
              Expanded(
                child: CustomTextField(
                    textFieldController: signupController.lastNameController,
                    validator: signupController.lastNameValidator,
                    hintText: TTextConstants.lastNameHint,
                    prefixIcon: Iconsax.user,
                    labelText: TTextConstants.lastName,
                    controller: signupController,
                    obscureText: false),
              ),
            ],
          ),
          const SizedBox(height: TUiConstants.spaceBtwInputFields),
          CustomTextField(
              textFieldController: signupController.userNameController,
              validator: signupController.usernameValidator,
              hintText: TTextConstants.usernameHint,
              prefixIcon: Iconsax.user_edit,
              labelText: TTextConstants.username,
              keyboardType: TextInputType.text,
              controller: signupController,
              obscureText: false),
          const SizedBox(height: TUiConstants.spaceBtwInputFields),
          CustomTextField(
              textFieldController: signupController.emailController,
              validator: signupController.emailValidator,
              hintText: TTextConstants.emailHint,
              prefixIcon: Icons.email_outlined,
              labelText: TTextConstants.email,
              keyboardType: TextInputType.emailAddress,
              controller: signupController,
              obscureText: false),
          const SizedBox(height: TUiConstants.spaceBtwInputFields),
          CustomTextField(
              textFieldController: signupController.phoneController,
              validator: signupController.phoneValidator,
              hintText: TTextConstants.phoneNumberHint,
              prefixIcon: Iconsax.call,
              labelText: TTextConstants.phoneNumber,
              keyboardType: TextInputType.phone,
              controller: signupController,
              obscureText: false),
          const SizedBox(height: TUiConstants.spaceBtwInputFields),
          CustomTextField(
            textFieldController: signupController.passwordController,
            suffixIcon: true,
            validator: signupController.passwordValidator,
            hintText: TTextConstants.passwordHint,
            keyboardType: TextInputType.visiblePassword,
            prefixIcon: Iconsax.lock,
            labelText: TTextConstants.password,
            controller: signupController,
          ), // Only this field has obscureText: true
        ],
      ),
    );
  }
}
