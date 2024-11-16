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
