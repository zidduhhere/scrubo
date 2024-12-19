import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/colors.dart';
import 'package:scrubo/utils/constants/enums.dart';
import 'package:scrubo/utils/constants/image_strings.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/widgets/containers/custom_rounded_containers.dart';
import 'package:scrubo/utils/widgets/headings/custom_title_text_widget.dart';

class PaymentMethodContainer extends StatelessWidget {
  const PaymentMethodContainer({
    super.key,
    required this.label,
  });

  final Payments label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TRoundedImageContainer(
          isNetworkImage: false,
          height: 30,
          fit: BoxFit.fill,
          width: 30,
          backgroundColor: TColors.lightSurface,
          padding: const EdgeInsets.all(TUiConstants.m),
          imageUrl: paymentMethod[label]['image'],
        ),
        TTitleTextWidget(
          text: paymentMethod[label]['text'],
        ),
      ],
    );
  }
}

class TPaymentContainerBottomSheet extends StatelessWidget {
  const TPaymentContainerBottomSheet({
    super.key,
    required this.label,
  });

  final Payments label;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(paymentMethod[label]['image'], height: 40, width: 40),
        const SizedBox(width: TUiConstants.defaultSpacing),
        Text(
          ' ${paymentMethod[label]['text']}',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: TColors.lightOnSurface,
                fontWeight: FontWeight.w500,
              ),
        )
      ],
    );
  }
}

Map<Payments, dynamic> paymentMethod = {
  Payments.phonePe: {
    'image': TImages.phonePe,
    'text': 'PhonePe',
  },
  Payments.gpay: {
    'image': TImages.gpay,
    'text': 'GPay',
  },
  Payments.cash: {
    'image': TImages.cash,
    'text': 'Cash',
  },
  Payments.upi: {
    'image': TImages.upi,
    'text': 'UPI',
  },
};

class TBottomContainerListTile extends StatelessWidget {
  const TBottomContainerListTile({super.key, required this.label});

  final Payments label;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
      onTap: () {},
      splashColor: TColors.lightPrimaryContainer,
      minTileHeight: 60,
      title: Text('${paymentMethod[label]["text"]}'),
      leading: Image.asset(
        paymentMethod[label]['image'],
        width: 40,
        height: 40,
      ),
    );
  }
}
