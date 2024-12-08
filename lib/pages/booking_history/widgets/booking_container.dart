import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/widgets/headings/custom_simple_title.dart';
import 'package:scrubo/utils/widgets/headings/custom_title_text_widget.dart';

class TBookingTagContainer extends StatelessWidget {
  const TBookingTagContainer({
    super.key,
    required this.iconData,
    required this.title,
    required this.val,
  });
  final IconData iconData;
  final String title;
  final String val;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(iconData),
        const SizedBox(width: TUiConstants.spaceBtwTexts),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TTitleTextWidget(text: title, isSmall: true),
            TCustomSimpleTitle(
              text: val,
            ),
          ],
        )
      ],
    );
  }
}
