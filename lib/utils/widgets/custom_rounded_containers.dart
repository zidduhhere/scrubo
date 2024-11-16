import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

class TRoundedContainer extends StatelessWidget {
  const TRoundedContainer({
    super.key,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.width,
    this.height,
    this.radius,
    this.onPressed,
    this.child,
    this.diffRadius = false,
    this.border,
    this.borderRadius,
    this.fit = BoxFit.contain,
  }) : assert(
          !diffRadius || borderRadius != null,
          'Give specific border in borderRadius if diffRadius is true',
        );

  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onPressed;
  final BoxFit fit;
  final Color? backgroundColor;
  final double? width;
  // final Text text;
  final double? height;
  final Widget? child;
  final double? radius;
  final BoxBorder? border;
  final bool diffRadius;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor ?? Theme.of(context).colorScheme.secondary,
          borderRadius: diffRadius
              ? borderRadius
              : BorderRadius.circular(
                  radius ?? TUiConstants.borderRadiusMedium,
                ),
        ),
        width: width ?? TUiConstants.indicatorWidth,
        height: height ?? TUiConstants.indicatorHeight,
        child: child,
        // margin: const EdgeInsets.symmetric(horizontal: 5.0),
      ),
    );
  }
}

class TRoundedImageContainer extends StatelessWidget {
  const TRoundedImageContainer(
      {super.key,
      this.padding,
      this.margin,
      this.onPressed,
      this.fit,
      this.applyImageRadius,
      this.border,
      required this.isNetworkImage,
      this.bordeRadius,
      this.backgroundColor,
      this.width,
      this.height,
      this.shadow,
      required this.imageUrl})
      : assert(!isNetworkImage || fit != null,
            "fit must be provided if isNetworkImage is true");

  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onPressed;
  final BoxFit? fit;
  final bool? applyImageRadius;
  final BoxBorder? border;
  final List<BoxShadow>? shadow;
  final bool isNetworkImage;
  final double? bordeRadius;
  final Color? backgroundColor;
  final double? width, height;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        boxShadow: shadow,
        color: backgroundColor ?? Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(
            bordeRadius ?? TUiConstants.borderRadiusMedium),
      ),
      child: ClipRect(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
              bordeRadius ?? TUiConstants.borderRadiusMedium),
          child: isNetworkImage
              ? Image.network(imageUrl, fit: fit)
              : Image.asset(
                  imageUrl,
                  height: 100,
                  fit: fit,
                ),
        ),
      ),
    );
  }
}
