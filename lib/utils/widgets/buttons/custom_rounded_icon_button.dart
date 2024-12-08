import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/widgets/containers/custom_rounded_containers.dart';

class TRoundedIconButton extends StatelessWidget {
  const TRoundedIconButton({
    super.key,
    this.height,
    this.width,
    this.borderRadius,
    required this.icon,
  });
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return TSizeAdjustableRoundedContainer(
      height: height ?? 40,
      width: width ?? 40,
      backgroundColor: Theme.of(context).colorScheme.onSurface ,
      diffRadius: true,
      borderRadius: borderRadius ??
          const BorderRadius.only(
            topLeft: Radius.circular(TUiConstants.borderRadiusMedium),
            bottomRight: Radius.circular(
              TUiConstants.borderRadiusMedium,
            ),
          ),
      child: Center(
          child: Icon(
        icon,
        color: Theme.of(context).colorScheme.onPrimary,
      )),
    );
  }
}
