import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/colors.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

/// CustomTextField is a custom stateless text field widget that takes in the following parameters:
/// - `FormFieldValidator<String>? validator`: The validator function for the text field.
/// - `TextInputType? keyboardType`: The keyboard type for the text field.
/// - `String hintText`: The hint text for the text field.
/// - `IconData prefixIcon`: The icon to be displayed at the beginning of the text field.q
/// - `Widget? prefixWidget`: The widget to be displayed at the beginning of the text field.
/// - `String labelText`: The label text for the text field.
/// - `IconData? suffixIcon`: The icon to be displayed at the end of the text field.
/// - `bool? obscureText`: A boolean value to determine if the text field should be obscured.
/// - `TextEditingController textFieldController`: The controller for the text field.
/// - `VoidCallback? onTap`: The callback function to be called when the text field is tapped.
/// - `ValueChanged? onChanged`: The callback function to be called when the text field value changes.
/// - `String? initialValue`: The initial value for the text field.
class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.validator,
    this.onChanged,
    this.onTap,
    this.keyboardType,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    required this.labelText,
    this.prefixWidget,
    this.obscureText,
    required this.textFieldController,
    this.initialValue,
  });

  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final String hintText;
  final IconData prefixIcon;
  final Widget? prefixWidget;
  final String labelText;
  final IconData? suffixIcon;
  final bool? obscureText;

  final TextEditingController textFieldController;
  final VoidCallback? onTap;
  final ValueChanged? onChanged;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      controller: textFieldController,
      expands: false,
      validator: validator,
      obscureText: obscureText ?? false,
      autocorrect: false,

      // autofocus: true,
      keyboardType: keyboardType ?? TextInputType.text,
      style: Theme.of(context)
          .textTheme
          .labelMedium!
          .copyWith(fontWeight: FontWeight.w500, color: TColors.lightOnSurface),
      decoration: InputDecoration(
        // hintStyle: TextStyle(color: Colors.red),
        // labelStyle: TextStyle(color: Colors.red),
        prefix: prefixWidget,
        contentPadding: const EdgeInsets.all(TUiConstants.m),
        hintText: hintText,
        prefixIcon: Icon(prefixIcon),
        suffix: GestureDetector(
          onTap: onTap,
          child: SizedBox(
            height: 24,
            width: 24,
            child: Icon(suffixIcon),
          ),
        ),
        labelText: labelText,
      ),
    );
  }
}

class TCustomSimpleTextField extends StatelessWidget {
  const TCustomSimpleTextField({
    super.key,
    required this.textFieldController,
    required this.obscureText,
    this.keyboardType,
    this.prefixWidget,
    this.hintText,
    this.prefixIcon,
    required this.labelText,
    this.suffix,
    this.suffixIcon,
    this.contentPadding,
  });

  final TextEditingController textFieldController;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? prefixWidget;
  final String? hintText;
  final IconData? prefixIcon;
  final String labelText;
  final Widget? suffix;
  final IconData? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textFieldController,
      expands: false,
      obscureText: obscureText,
      autocorrect: false,
      // autofocus: true,
      keyboardType: keyboardType ?? TextInputType.text,
      style: Theme.of(context).textTheme.labelMedium!.copyWith(
            fontWeight: FontWeight.w500,
            color: TColors.lightOnSurface,
          ),
      decoration: InputDecoration(
        // hintStyle: TextStyle(color: Colors.red),
        // labelStyle: TextStyle(color: Colors.red),
        prefix: prefixWidget,
        contentPadding: contentPadding ?? const EdgeInsets.all(TUiConstants.m),
        hintText: hintText,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: Icon(suffixIcon),
        suffix: suffix,
        labelText: labelText,
      ),
    );
  }
}
