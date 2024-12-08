import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

class CustomRowHeader extends StatelessWidget {
  const CustomRowHeader(
      {super.key,
      required this.leadingText,
      this.trailingText,
      this.action,
      required this.isTrailing});

  final String leadingText;
  final String? trailingText;
  final VoidCallback? action;
  final bool isTrailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leadingText,
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                fontSize: TUiConstants.fontSizeMedium,
                fontWeight: FontWeight.w600,
                letterSpacing: 0,
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
        GestureDetector(
          onTap: isTrailing ? action : null,
          child: Text(
            trailingText ?? "",
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        ),
      ],
    );
  }
}
