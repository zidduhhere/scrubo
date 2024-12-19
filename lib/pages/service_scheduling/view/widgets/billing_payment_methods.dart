import 'package:flutter/material.dart';
import 'package:scrubo/pages/payment/widgets/payment_methods_view.dart';
import 'package:scrubo/pages/service_scheduling/view/widgets/payment_method_container.dart';
import 'package:scrubo/utils/constants/enums.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/widgets/headings/custom_row_header.dart';

class BillingPaymentMethodSection extends StatelessWidget {
  const BillingPaymentMethodSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomRowHeader(
          leadingText: 'Payment Method',
          isTrailing: true,
          trailingText: 'Change',
          action: () {
            showModalBottomSheet(
                context: context,
                builder: (_) {
                  return const PaymentMethodsView();
                });
          },
        ),
        const SizedBox(height: TUiConstants.defaultSpacing),
        const Row(
          children: [
            PaymentMethodContainer(
              label: Payments.phonePe,
            ),
            SizedBox(height: TUiConstants.defaultSpacing),
          ],
        ),
      ],
    );
  }
}
