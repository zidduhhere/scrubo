import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/widgets/containers/custom_shimmer.dart';

class TCategoryShimmer extends StatelessWidget {
  const TCategoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (_, __) {
            return const Column(
              children: [
                TShimmerEffect(
                  width: 40,
                  height: 40,
                  borderRadius: 55,
                ),
                SizedBox(height: TUiConstants.s),
                TShimmerEffect(
                  width: 60,
                  height: 8,
                ),
              ],
            );
          },
          separatorBuilder: (_, __) =>
              const SizedBox(width: TUiConstants.defaultSpacing * 2.5),
          itemCount: 8),
    );
  }
}
