import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

class TRoundedContainer extends StatelessWidget {
  const TRoundedContainer({
    super.key,
    this.padding,
    this.margin,
    this.backgroundColor,
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
  // final double? width;
  // final Text text;
  // final double? height;
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
        border: border,
        color: backgroundColor ?? Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(
            bordeRadius ?? TUiConstants.borderRadiusMedium),
      ),
      child: ClipRect(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
              bordeRadius ?? TUiConstants.borderRadiusMedium),
          child: isNetworkImage
              ? CachedNetworkImage(imageUrl: imageUrl, fit: fit)
              : Image.asset(
                  imageUrl,
                  fit: BoxFit.contain,
                  width: width ?? double.maxFinite,
                  height: height ?? double.maxFinite,
                  // width: double.infinity,
                ),
        ),
      ),
    );
  }
}

class TSizeAdjustableRoundedContainer extends StatelessWidget {
  const TSizeAdjustableRoundedContainer({
    super.key,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.radius,
    this.onPressed,
    this.width,
    this.height,
    this.child,
    this.diffRadius = false,
    this.border,
    this.borderRadius,
  }) : assert(
          !diffRadius || borderRadius != null,
          'Give specific border in borderRadius if diffRadius is true',
        );

  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onPressed;

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
        height: height,
        width: width,
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
        child: child,
        // margin: const EdgeInsets.symmetric(horizontal: 5.0),
      ),
    );
  }
}

class TRoundedDecorationImageContainer extends StatelessWidget {
  const TRoundedDecorationImageContainer(
      {super.key,
      this.height,
      this.width,
      this.padding,
      this.radius,
      required this.borderColor,
      required this.imageUrl,
      this.fit,
      this.margin,
      required this.isNetworkImage});

  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final double? radius;
  final Color borderColor;
  final String imageUrl;
  final BoxFit? fit;
  final EdgeInsetsGeometry? margin;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: isNetworkImage ? NetworkImage(imageUrl) : AssetImage(imageUrl),
          fit: fit ?? BoxFit.fill,
        ),
        border: Border.all(color: borderColor),
        // color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(
          radius ?? TUiConstants.borderRadiusMedium,
        ),
      ),

      // margin: const EdgeInsets.symmetric(horizontal: 5.0),
    );
  }
}
