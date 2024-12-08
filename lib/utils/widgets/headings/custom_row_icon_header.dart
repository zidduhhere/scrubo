import 'package:flutter/material.dart';

class RowIconButtons extends StatelessWidget {
  const RowIconButtons({
    super.key,
    required this.leading,
    required this.trailing,
    required this.leaddingPressed,
    required this.trailingPressed,
    this.trailingColor,
  });

  final IconData leading;
  final IconData trailing;
  final VoidCallback leaddingPressed;
  final VoidCallback trailingPressed;
  final Color? trailingColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: leaddingPressed,
          icon: Icon(leading),
        ),
        IconButton(
          color: trailingColor,
          onPressed: trailingPressed,
          icon: Icon(trailing),
        )
      ],
    );
  }
}
