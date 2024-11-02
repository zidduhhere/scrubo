import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:scrubo/pages/authentication/login/viewmodel/login_controller.dart';
import 'package:scrubo/utils/constants/colors.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.validator,
      this.keyboardType,
      required this.hintText,
      required this.prefixIcon,
      this.suffixIcon = false,
      required this.labelText,
      required this.controller,
      required this.textFieldController});

  final FormFieldValidator<String> validator;
  final TextInputType? keyboardType;
  final String hintText;
  final IconData prefixIcon;
  final String labelText;
  final bool suffixIcon;
  final LoginController controller;
  final TextEditingController textFieldController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        controller: textFieldController,
        validator: validator,
        obscureText: controller.obscureState.value,
        autocorrect: false,
        // autofocus: true,
        keyboardType: keyboardType ?? TextInputType.text,
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
            fontWeight: FontWeight.w500,
            color: controller.isDarkMode.value
                ? TColors.darkOnSurface
                : TColors.lightOnSurface),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(TUiConstants.m),
          hintText: hintText,
          prefixIcon: Icon(prefixIcon),
          suffix: suffixIcon
              ? GestureDetector(
                  onTap: controller.toggleObscure,
                  child: Icon(controller.obscureState.value
                      ? Iconsax.eye_slash
                      : Iconsax.eye),
                )
              : null,
          labelText: labelText,
        ),
      ),
    );
  }
}
