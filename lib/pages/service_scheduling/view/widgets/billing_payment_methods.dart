import 'package:flutter/material.dart';
import 'package:scrubo/pages/service_scheduling/view/widgets/payment_method_container.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/widgets/headings/custom_row_header.dart';

class BillingPaymentMethodSection extends StatelessWidget {
  const BillingPaymentMethodSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomRowHeader(
          leadingText: 'Payment Method',
          isTrailing: true,
          trailingText: 'Change',
        ),
        SizedBox(height: TUiConstants.defaultSpacing),
        Row(
          children: [
            PaymentMethodContainer(
              label: 'PhonePe',
            ),
            SizedBox(height: TUiConstants.defaultSpacing),
          ],
        ),
      ],
    );
  }
}
