import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:scrubo/utils/constants/colors.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.validator,
    this.keyboardType,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon = false,
    required this.labelText,
    this.prefixWidget,
    required this.controller,
    this.obscureText,
    required this.textFieldController,
  });

  final FormFieldValidator<String> validator;
  final TextInputType? keyboardType;
  final String hintText;
  final IconData prefixIcon;
  final Widget? prefixWidget;
  final String labelText;
  final bool suffixIcon;
  final bool? obscureText;
  final dynamic controller;
  final TextEditingController textFieldController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        controller: textFieldController,
        expands: false,
        validator: validator,
        obscureText: obscureText ?? controller.obscureState.value,
        autocorrect: false,
        // autofocus: true,
        keyboardType: keyboardType ?? TextInputType.text,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
            fontWeight: FontWeight.w500,
            color: controller.isDarkMode.value
                ? TColors.darkOnSurface
                : TColors.lightOnSurface),
        decoration: InputDecoration(
          // hintStyle: TextStyle(color: Colors.red),
          // labelStyle: TextStyle(color: Colors.red),
          prefix: prefixWidget,
          contentPadding: const EdgeInsets.all(TUiConstants.m),
          hintText: hintText,
          prefixIcon: Icon(prefixIcon),
          suffix: suffixIcon
              ? GestureDetector(
                  onTap: controller.toggleObscure,
                  child: SizedBox(
                    height: 24,
                    width: 24,
                    child: Icon(controller.obscureState.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye),
                  ),
                )
              : null,
          labelText: labelText,
        ),
      ),
    );
  }
}