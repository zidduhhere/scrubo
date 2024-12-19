import 'package:flutter/material.dart';
import 'package:scrubo/pages/service_scheduling/view/widgets/payment_method_container.dart';
import 'package:scrubo/utils/constants/enums.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

class PaymentMethodsView extends StatelessWidget {
  const PaymentMethodsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(TUiConstants.defaultSpacing),
      child: Column(
        children: [
          TBottomContainerListTile(
            label: Payments.gpay,
          ),
          SizedBox(height: TUiConstants.defaultSpacing),
          TBottomContainerListTile(
            label: Payments.upi,
          ),
          SizedBox(height: TUiConstants.defaultSpacing),
          TBottomContainerListTile(
            label: Payments.phonePe,
          ),
          SizedBox(height: TUiConstants.defaultSpacing),
          TBottomContainerListTile(
            label: Payments.cash,
          ),
          SizedBox(height: TUiConstants.defaultSpacing),
        ],
      ),
    );
  }
}
