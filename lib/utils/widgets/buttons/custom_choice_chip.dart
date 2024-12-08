import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/colors.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    required this.onSelected,
  });
  final String text;
  final bool selected;
  final Function(bool) onSelected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      iconTheme: IconThemeData(
        color: selected ? Colors.white : TColors.lightOnSurface,
      ),
      label: Text(
        text,
        style: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: selected ? Colors.white : null,
            ),
      ),
      selected: selected,
      onSelected: onSelected,
    );
  }
}
