import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/colors.dart';
import 'package:scrubo/utils/constants/image_strings.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/widgets/containers/custom_rounded_containers.dart';
import 'package:scrubo/utils/widgets/headings/custom_title_text_widget.dart';

class PaymentMethodContainer extends StatelessWidget {
  const PaymentMethodContainer({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> paymentMethod = {
      'PhonePe': TImages.phonePe,
      'Google Pay': TImages.gpay,
      'Cash': TImages.cash
    };
    return Row(
      children: [
        TRoundedImageContainer(
          isNetworkImage: false,
          height: 30,
          width: 30,
          backgroundColor: TColors.lightSurface,
          padding: const EdgeInsets.all(TUiConstants.m),
          imageUrl: paymentMethod[label],
        ),
        TTitleTextWidget(
          text: label,
        ),
      ],
    );
  }
}
