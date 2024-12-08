import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:scrubo/utils/constants/colors.dart';

class TCustomReadMoreText extends StatelessWidget {
  const TCustomReadMoreText({
    this.description,
    this.trimLines = 2,
    super.key,
  });
  final String? description;
  final int trimLines;
  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      description ??
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum pentorum iscum lupsum ainte hint over the hills of the world and this is a clmap with no enteres and edges ",
      trimLines: trimLines,
      colorClickableText: TColors.lightPrimaryColor,
      trimMode: TrimMode.Line,
      moreStyle: Theme.of(context)
          .textTheme
          .labelMedium!
          .copyWith(color: TColors.lightPrimaryColor),
      lessStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
            color: TColors.lightPrimaryColor,
          ),
      trimCollapsedText: ' read more',
      trimExpandedText: ' read less',
    );
  }
}
