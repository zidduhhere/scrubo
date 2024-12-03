import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

class TCircualrImage extends StatelessWidget {
  const TCircualrImage({
    super.key,
    this.width,
    this.height,
    this.padding,
    required this.imageUrl,
  });

  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 50,
      height: height ?? 50,
      padding: padding ?? const EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TUiConstants.borderRadiusMax),
        color: Theme.of(context).colorScheme.secondary,
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
