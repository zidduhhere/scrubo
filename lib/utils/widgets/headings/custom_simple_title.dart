import 'package:flutter/material.dart';

class TCustomSimpleTitle extends StatelessWidget {
  const TCustomSimpleTitle({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: Theme.of(context).colorScheme.onSecondaryContainer,
          fontWeight: FontWeight.w500),
    );
  }
}
