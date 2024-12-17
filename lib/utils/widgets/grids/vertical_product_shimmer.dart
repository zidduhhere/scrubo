import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/widgets/containers/custom_shimmer.dart';
import 'package:scrubo/utils/widgets/grids/custom_grid.dart';

class TVerticalProductShimmer extends StatelessWidget {
  const TVerticalProductShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: TGridView(
            mainAxisSpacing: TUiConstants.gridViewMainAxisSpacing,
            crossAxisSpacing: TUiConstants.gridViewCrossAxisSpacing / 1,
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            itemBuilder: (_, index) {
              return const TShimmerEffect(width: 80, height: 80);
            },
            itemCount: 4));
  }
}
