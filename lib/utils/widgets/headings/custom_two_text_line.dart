import 'package:flutter/material.dart';

class TwoTextSameLine extends StatelessWidget {
  const TwoTextSameLine({
    super.key,
    required this.firstText,
    this.firstStyle,
    required this.secondText,
    this.secondStyle,
  });

  final String firstText;
  final TextStyle? firstStyle;
  final String secondText;
  final TextStyle? secondStyle;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
            text: firstText,
            style: firstStyle ?? Theme.of(context).textTheme.labelMedium),
        TextSpan(
          text: secondText,
          style: secondStyle ??
              Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
        ),
      ]),
    );
  }
}
