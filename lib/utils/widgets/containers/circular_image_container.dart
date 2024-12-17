import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/image_strings.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/widgets/containers/custom_shimmer.dart';

class TCircualrImage extends StatelessWidget {
  const TCircualrImage(
      {super.key,
      this.width,
      this.height,
      this.padding,
      required this.imageUrl,
      this.isNetworkImage = false,
      this.localImage});

  final double? width;
  final double? height;
  final bool isNetworkImage;
  final EdgeInsetsGeometry? padding;
  final String imageUrl;
  final String? localImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 50,
      height: height ?? 50,
      padding: padding ?? const EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TUiConstants.borderRadiusMax),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: isNetworkImage
          ? ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CachedNetworkImage(
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                  child: TShimmerEffect(
                    width: width ?? 55,
                    height: height ?? 55,
                  ),
                ),
                errorWidget: (context, url, error) =>
                    Image.asset(TImages.avatar, fit: BoxFit.cover),
                imageUrl: imageUrl,
                fit: BoxFit.cover,
              ),
            )
          : Image.asset(localImage ?? TImages.avatar, fit: BoxFit.cover),
    );
  }
}
