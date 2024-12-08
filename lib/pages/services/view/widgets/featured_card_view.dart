import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/widgets/containers/custom_rounded_containers.dart';

class FeaturedServiceCard extends StatelessWidget {
  const FeaturedServiceCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final String image;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      padding: const EdgeInsets.all(TUiConstants.s),
      borderRadius: BorderRadius.circular(
        TUiConstants.borderRadiusMedium,
      ),
      backgroundColor: Colors.transparent,
      border: Border.all(
        color: Theme.of(context).colorScheme.surfaceContainerHigh,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Container(
                height: 56,
                width: 50,
                padding: const EdgeInsets.all(TUiConstants.s),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    TUiConstants.borderRadiusMedium,
                  ),
                ),
                child: Image.asset(image)),
          ),
          const SizedBox(width: TUiConstants.s),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                ),
                Text(
                  subtitle,
                  maxLines: 1,
                  // overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 10,
                      ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
