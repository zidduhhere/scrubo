import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/image_strings.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/widgets/containers/custom_shimmer.dart';

class CategoriesImageContainer extends StatelessWidget {
  const CategoriesImageContainer(
      {super.key,
      required this.isNetworkImage,
      this.width,
      this.height,
      required this.imageUrl});

  final bool isNetworkImage;
  final double? width;
  final double? height;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(TUiConstants.defaultSpacing),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TUiConstants.borderRadiusMax),
          color: Theme.of(context).colorScheme.surfaceContainerHigh,
        ),
        child: isNetworkImage
            ? CachedNetworkImage(
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                  child: TShimmerEffect(
                    width: width ?? 40,
                    height: height ?? 40,
                  ),
                ),
                errorWidget: (context, url, error) =>
                    Image.asset(TImages.avatar, fit: BoxFit.cover),
                imageUrl: imageUrl,
                fit: BoxFit.contain,
                scale: 15,
              )
            : const Icon(TUiConstants.iconWarning));
  }
}
