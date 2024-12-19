import 'package:flutter/material.dart';

class TFormDivider extends StatelessWidget {
  const TFormDivider({
    super.key,
    required this.text,
  });

  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Divider(
            color: Theme.of(context).colorScheme.onSurface,
            height: 1,
            endIndent: 5,
            indent: 60,
            thickness: .5,
          ),
        ),
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(color: Theme.of(context).colorScheme.secondary),
        ),
        Flexible(
          child: Divider(
            color: Theme.of(context).colorScheme.onSurface,
            height: 1,
            endIndent: 60,
            indent: 5,
            thickness: .5,
          ),
        ),
      ],
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Theme.of(context)
          .colorScheme
          .secondary
          .withValues(red: 0, green: 0, blue: 0, alpha: .1),
      height: 1,
      thickness: 1,
    );
  }
}
