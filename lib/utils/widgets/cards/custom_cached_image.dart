import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

class TCachedNetworkImage extends StatelessWidget {
  const TCachedNetworkImage({
    super.key,
    required this.isNetworkImage,
    required this.image,
    this.subIcon,
  });

  final bool isNetworkImage;
  final String image;
  final IconData? subIcon;
  @override
  Widget build(BuildContext context) {
    return isNetworkImage
        ? CachedNetworkImage(
            imageUrl: image,
            fit: BoxFit.contain,
          )
        : Icon(
            subIcon ?? TUiConstants.iconWarning,
            color: Colors.black,
          );
  }
}

class TCachedNetworkImageContainer extends StatelessWidget {
  const TCachedNetworkImageContainer(
      {super.key,
      required this.height,
      required this.width,
      required this.radius,
      required this.image,
      required this.subIcon});

  final double height;
  final double width;
  final double radius;
  final String image;

  final IconData subIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        child: TCachedNetworkImage(
          isNetworkImage: true,
          image: image,
          subIcon: subIcon,
        ),
      ),
    );
  }
}
