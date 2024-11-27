import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

class MyAddressView extends StatelessWidget {
  const MyAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              'My Address',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            pinned: true,
            floating: true,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(TUiConstants.defaultSpacing),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const AddressCardView(
                  title: 'Home',
                  address: '123 Street, Suburb\nNew York, NY 10001',
                  icon: TUiConstants.iconHome,
                  isDefault: true,
                ),
                const SizedBox(height: TUiConstants.defaultSpacing),
                const AddressCardView(
                  title: 'Work',
                  address: '456 Office Building, Business Bay\nDubai, UAE',
                  icon: Iconsax.briefcase,
                ),
                const SizedBox(height: TUiConstants.defaultSpacing),
                const AddressCardView(
                  title: 'Other',
                  address: '789 Street, Suburb\nLos Angeles, CA 90001',
                  icon: Iconsax.building,
                ),
              ]),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () {},
        child: const Icon(Iconsax.add),
      ),
    );
  }
}

class AddressCardView extends StatelessWidget {
  final String title;
  final String address;
  final IconData icon;
  final bool isDefault;
  final VoidCallback? onTap;
  final VoidCallback? onEdit;

  const AddressCardView({
    super.key,
    required this.title,
    required this.address,
    required this.icon,
    this.isDefault = false,
    this.onTap,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(TUiConstants.borderRadiusLarge),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.1),
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(TUiConstants.borderRadiusLarge),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(TUiConstants.borderRadiusLarge),
          child: Padding(
            padding: const EdgeInsets.all(TUiConstants.defaultSpacing),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(TUiConstants.paddingSmall),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(
                            TUiConstants.borderRadiusMedium),
                      ),
                      child: Icon(
                        icon,
                        size: TUiConstants.iconSizeLarge,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(width: TUiConstants.defaultSpacing),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                title,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              if (isDefault) ...[
                                const SizedBox(width: TUiConstants.s),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: TUiConstants.paddingSmall,
                                    vertical: TUiConstants.paddingSmall / 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    borderRadius: BorderRadius.circular(
                                        TUiConstants.borderRadiusSmall),
                                  ),
                                  child: Text(
                                    'Default',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondaryContainer,
                                        ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                          const SizedBox(height: TUiConstants.s / 2),
                          Text(
                            address,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                                ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: onEdit,
                      icon: Icon(
                        TUiConstants.iconEdit,
                        size: TUiConstants.iconSizeMedium,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
