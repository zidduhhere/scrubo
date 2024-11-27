import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

class SmallProfileContainer extends StatelessWidget {
  const SmallProfileContainer(
      {super.key, this.leading, required this.text, this.trailing})
      : assert(leading == null || trailing == null,
            'Either leading or trailing can be provided');
  final Widget? leading, trailing;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: TUiConstants.smallContainerHeight,
      width: TUiConstants.smallContainerWidth,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryFixed,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          leading ?? const SizedBox(),
          const SizedBox(width: TUiConstants.paddingSmall),
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: Theme.of(context).colorScheme.onPrimaryFixed),
          ),
          const SizedBox(width: TUiConstants.paddingSmall),
          trailing ?? const SizedBox(),
        ],
      ),
    );
  }
}
