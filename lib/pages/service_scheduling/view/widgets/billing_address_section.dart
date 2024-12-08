import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/widgets/headings/custom_row_header.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomRowHeader(
            leadingText: 'Pickup Address',
            isTrailing: true,
            trailingText: 'Change'),
        SizedBox(height: TUiConstants.defaultSpacing),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ubaid Atlhaf',
            ),
            SizedBox(height: TUiConstants.spaceBtwTexts),
            TBillingAddressTextContainer(
                leadingIcon: TUiConstants.iconPhone, text: '+91 9876543210'),
            SizedBox(height: TUiConstants.spaceBtwTexts),
            TBillingAddressTextContainer(
              leadingIcon: TUiConstants.iconCity,
              text: 'House No. 123, Street No. 123, City, State, Country',
            ),
          ],
        )
      ],
    );
  }
}

class TBillingAddressTextContainer extends StatelessWidget {
  const TBillingAddressTextContainer({
    super.key,
    required this.leadingIcon,
    required this.text,
  });
  final IconData leadingIcon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1, child: Icon(leadingIcon)),
        const SizedBox(width: TUiConstants.spaceBtwTexts),
        Expanded(
          flex: 11,
          child: Text(
            text,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
