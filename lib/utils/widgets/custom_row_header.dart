import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

class CustomRowHeader extends StatelessWidget {
  const CustomRowHeader({
    super.key,
    required this.leadingText,
    this.trailingText,
  });

  final String leadingText;
  final String? trailingText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leadingText,
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                fontSize: TUiConstants.fontSizeMedium,
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
        Text(
          trailingText ?? "",
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                fontSize: TUiConstants.fontSizeMedium,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
      ],
    );
  }
}
