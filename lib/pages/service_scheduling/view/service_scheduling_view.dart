// service_scheduling_controller.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrubo/pages/service_scheduling/view/widgets/billing_address_section.dart';
import 'package:scrubo/pages/service_scheduling/view/widgets/billing_payment_methods.dart';
import 'package:scrubo/pages/service_scheduling/view/widgets/billing_payment_section.dart';
import 'package:scrubo/pages/service_scheduling/view/widgets/custom_coupon_container.dart';
import 'package:scrubo/pages/service_scheduling/view/widgets/time_date_scheduling.dart';
import 'package:scrubo/utils/constants/image_strings.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/widgets/buttons/custom_elevated_button.dart';
import 'package:scrubo/utils/widgets/cards/custom_horizontal_card_view.dart';
import 'package:scrubo/utils/widgets/containers/custom_rounded_containers.dart';
import 'package:scrubo/utils/widgets/custom/custom_divider.dart';
import 'package:scrubo/utils/widgets/headings/custom_app_bar.dart';

class ServiceSchedulingView extends StatelessWidget {
  const ServiceSchedulingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TCustomSimpleAppbar(
        title: 'Schedule Service',
        implyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TUiConstants.defaultSpacing),
          child: Column(
            children: [
              ///Checkout Product Container
              const CheckoutHorizontalContainer(),
              const SizedBox(height: TUiConstants.defaultSpacing),

              ///Coupon Code TextField
              const TCouponContainer(),
              const SizedBox(height: TUiConstants.defaultSpacing),
              // -- Billing Section
              TRoundedContainer(
                padding: const EdgeInsets.all(TUiConstants.m),
                backgroundColor: Colors.transparent,
                border: Border.all(
                  color: Theme.of(context).colorScheme.surfaceContainerHigh,
                ),
                child: Column(
                  children: [
                    //Payment Section
                    const BillingPaymentSection(),

                    //Divider
                    const SizedBox(height: TUiConstants.defaultSpacing),
                    const TFormDivider(text: 'PAYMENT'),
                    const SizedBox(height: TUiConstants.spaceBtwSections),

                    const BillingPaymentMethodSection(),
                    const TFormDivider(text: 'ADDRESS'),
                    const SizedBox(height: TUiConstants.spaceBtwSections),
                    const BillingAddressSection(),
                    const SizedBox(height: TUiConstants.spaceBtwSections),
                    const DateTimeSchedule(),
                    const SizedBox(height: TUiConstants.spaceBtwSections),

                    CustomElevatedButton(
                        onTap: () => Get.to(() => const SuccessPage()),
                        text: 'Checkout')
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Success'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Transaction Successful',
              style: Theme.of(context).textTheme.headlineSmall),
          Center(
            child: Image.asset(
              TImages.transactionSuccess,
              width: 200,
            ),
          ),
        ],
      ),
    );
  }
}
