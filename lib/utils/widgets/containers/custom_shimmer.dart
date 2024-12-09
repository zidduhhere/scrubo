import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:shimmer/shimmer.dart';

class TShimmerEffect extends StatelessWidget {
  const TShimmerEffect(
      {super.key,
      required this.width,
      required this.height,
      this.borderRadius});

  final double width;
  final double height;
  final double? borderRadius;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[200]!,
      highlightColor: Colors.grey[400]!,
      direction: ShimmerDirection.ltr,
      loop: 10,
      period: const Duration(seconds: 10),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(
              borderRadius ?? TUiConstants.borderRadiusLarge),
        ),
      ),
    );
  }
}
