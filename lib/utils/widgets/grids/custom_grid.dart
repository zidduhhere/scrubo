import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

class TGridView extends StatelessWidget {
  const TGridView({
    super.key,
    required this.itemBuilder,
    this.childAspectRatio,
    this.crossAxisSpacing,
    this.mainAxisSpacing,
    this.crossAxisCount,
    this.padding,
    required this.itemCount,
  });
  final dynamic itemBuilder;
  final double? childAspectRatio;
  final double? crossAxisSpacing;
  final double? mainAxisSpacing;
  final int? crossAxisCount;
  final EdgeInsets? padding;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: padding ?? EdgeInsets.zero,
      itemCount: itemCount,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing:
              mainAxisSpacing ?? TUiConstants.gridViewMainAxisSpacing * .8,
          crossAxisSpacing:
              crossAxisSpacing ?? TUiConstants.gridViewCrossAxisSpacing,
          childAspectRatio: childAspectRatio ?? 2.5,
          crossAxisCount: crossAxisCount ?? 2),
      itemBuilder: itemBuilder,
    );
  }
}
