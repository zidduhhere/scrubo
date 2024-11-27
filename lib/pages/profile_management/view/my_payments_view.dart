import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

// payment_card_widget.dart
class TPaymentCard extends StatelessWidget {
  final String serviceName;
  final String vehicleName;
  final String vehicleNumber;
  final double amount;
  final double discount;
  final String date;
  final String paymentMethod;
  final String status;
  final IconData icon;

  const TPaymentCard({
    super.key,
    required this.serviceName,
    required this.vehicleName,
    required this.vehicleNumber,
    required this.amount,
    required this.discount,
    required this.date,
    required this.paymentMethod,
    required this.status,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      margin: const EdgeInsets.only(bottom: TUiConstants.defaultSpacing),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TUiConstants.borderRadiusLarge),
      ),
      // backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          TPaddedContent(
            child: Column(
              children: [
                TServiceHeader(
                  icon: icon,
                  serviceName: serviceName,
                  date: date,
                  amount: amount,
                  discount: discount,
                ),
                const SizedBox(height: TUiConstants.defaultSpacing),
                const TDivider(),
                const SizedBox(height: TUiConstants.defaultSpacing),
                TVehicleInfo(
                  vehicleName: vehicleName,
                  vehicleNumber: vehicleNumber,
                  paymentMethod: paymentMethod,
                ),
              ],
            ),
          ),
          TFinalAmount(amount: amount, discount: discount),
        ],
      ),
    );
  }
}

// Reusable components
class TPaddedContent extends StatelessWidget {
  final Widget child;

  const TPaddedContent({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TUiConstants.defaultSpacing),
      child: child,
    );
  }
}

class TServiceHeader extends StatelessWidget {
  final IconData icon;
  final String serviceName;
  final String date;
  final double amount;
  final double discount;

  const TServiceHeader({
    super.key,
    required this.icon,
    required this.serviceName,
    required this.date,
    required this.amount,
    required this.discount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TIconContainer(icon: icon),
        const SizedBox(width: TUiConstants.defaultSpacing),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                serviceName,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                date,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.outline,
                    ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '₹${amount.toStringAsFixed(0)}',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            if (discount > 0)
              Text(
                '- ₹${discount.toStringAsFixed(0)}',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.error,
                    ),
              ),
          ],
        ),
      ],
    );
  }
}

class TIconContainer extends StatelessWidget {
  final IconData icon;

  const TIconContainer({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(TUiConstants.paddingSmall),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(TUiConstants.borderRadiusMedium),
      ),
      child: Icon(
        icon,
        size: TUiConstants.iconSizeLarge,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}

class TVehicleInfo extends StatelessWidget {
  final String vehicleName;
  final String vehicleNumber;
  final String paymentMethod;

  const TVehicleInfo({
    super.key,
    required this.vehicleName,
    required this.vehicleNumber,
    required this.paymentMethod,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              TUiConstants.iconCar,
              size: TUiConstants.iconSizeMedium,
              color: Theme.of(context).colorScheme.outline,
            ),
            const SizedBox(width: TUiConstants.s),
            Text(
              '$vehicleName • $vehicleNumber',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        TPaymentMethodChip(method: paymentMethod),
      ],
    );
  }
}

class TPaymentMethodChip extends StatelessWidget {
  final String method;

  const TPaymentMethodChip({super.key, required this.method});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: TUiConstants.paddingMedium,
        vertical: TUiConstants.paddingSmall,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(TUiConstants.borderRadiusMedium),
      ),
      child: Text(
        method,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
      ),
    );
  }
}

class TFinalAmount extends StatelessWidget {
  final double amount;
  final double discount;

  const TFinalAmount({super.key, required this.amount, required this.discount});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: TUiConstants.defaultSpacing,
        vertical: TUiConstants.paddingSmall,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(TUiConstants.borderRadiusLarge),
          bottomRight: Radius.circular(TUiConstants.borderRadiusLarge),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Final Amount',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            '₹${(amount - discount).toStringAsFixed(0)}',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
        ],
      ),
    );
  }
}

class TDivider extends StatelessWidget {
  const TDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
    );
  }
}

// Usage in MyPaymentsView
class MyPaymentsView extends StatelessWidget {
  const MyPaymentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              'Payment History',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            pinned: true,
            floating: true,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(TUiConstants.defaultSpacing),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const TPaymentCard(
                  serviceName: 'Premium Car Wash',
                  vehicleName: 'BMW X5',
                  vehicleNumber: 'KL 01 AB 1234',
                  amount: 1200,
                  discount: 200,
                  date: '12 Mar 2024',
                  paymentMethod: 'UPI',
                  status: 'Completed',
                  icon: TUiConstants.iconCar,
                ),
                const TPaymentCard(
                  serviceName: 'Oil Change',
                  vehicleName: 'Honda City',
                  vehicleNumber: 'KL 01 CD 5678',
                  amount: 3500,
                  discount: 500,
                  date: '05 Mar 2024',
                  paymentMethod: 'Card',
                  status: 'Completed',
                  icon: TUiConstants.iconOil,
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
