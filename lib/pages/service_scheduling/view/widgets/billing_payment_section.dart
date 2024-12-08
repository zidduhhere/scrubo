import 'package:flutter/material.dart';
import 'package:scrubo/pages/service_scheduling/view/widgets/custom_billing_container_text.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/widgets/headings/custom_price_text_views.dart';
import 'package:scrubo/utils/widgets/headings/custom_title_text_widget.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TCheckoutBillingContainerText(
                label: 'Subtotal',
                value: '2500',
              ),
              TCheckoutBillingContainerText(
                label: 'Pickup Charge',
                value: '150',
                isPriceSmall: true,
              ),
              TCheckoutBillingContainerText(
                label: 'Tax Fee',
                value: '200',
                isPriceSmall: true,
              ),
              SizedBox(height: TUiConstants.defaultSpacing),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TTitleTextWidget(text: 'OrderTotal'),
                  CheckoutPriceTextWidget(
                    price: '2850',
                    sign: TUiConstants.rupeeSign,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
