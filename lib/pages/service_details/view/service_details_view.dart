import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrubo/utils/constants/image_strings.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/widgets/custom_elevated_button.dart';

class ServiceDetailsView extends StatelessWidget {
  const ServiceDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Combined SliverAppBar with custom functionality
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            floating: true,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    TImages.carWash,
                    fit: BoxFit.cover,
                  ),
                  // Gradient overlay for better text visibility
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.5),
                        ],
                      ),
                    ),
                  ),
                  // Discount Badge
                  Positioned(
                    bottom: TUiConstants.defaultSpacing,
                    left: TUiConstants.defaultSpacing,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: TUiConstants.paddingMedium,
                        vertical: TUiConstants.paddingSmall,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.errorContainer,
                        borderRadius: BorderRadius.circular(
                            TUiConstants.borderRadiusMedium),
                      ),
                      child: Text(
                        '20% OFF',
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onErrorContainer,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Rest of your content...
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(TUiConstants.defaultSpacing),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'Premium Car Wash',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: TUiConstants.paddingMedium,
                          vertical: TUiConstants.paddingSmall,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(
                              TUiConstants.borderRadiusMedium),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: TUiConstants.iconSizeMedium,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(width: TUiConstants.s / 2),
                            Text(
                              '4.8',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: TUiConstants.defaultSpacing),

                  // Price
                  Row(
                    children: [
                      Text(
                        '₹200',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                      const SizedBox(width: TUiConstants.s),
                      Text(
                        '₹250',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  decoration: TextDecoration.lineThrough,
                                  color: Theme.of(context).colorScheme.outline,
                                ),
                      ),
                    ],
                  ),

                  const SizedBox(height: TUiConstants.spaceBtwSections),

                  // Shop Info
                  Container(
                    padding: const EdgeInsets.all(TUiConstants.defaultSpacing),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius:
                          BorderRadius.circular(TUiConstants.borderRadiusLarge),
                      border: Border.all(
                        color: Theme.of(context)
                            .colorScheme
                            .outline
                            .withOpacity(0.1),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                                borderRadius: BorderRadius.circular(
                                    TUiConstants.borderRadiusMedium),
                                image: const DecorationImage(
                                  image: AssetImage(TImages.avatar),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: TUiConstants.defaultSpacing),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'AutoGTG Services',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  const SizedBox(height: TUiConstants.xl),
                                  Text(
                                    'Professional Car Care Since 2010',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: TUiConstants.defaultSpacing),
                        const Divider(),
                        const SizedBox(height: TUiConstants.defaultSpacing),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildShopStat(
                              context,
                              '4.8',
                              'Rating',
                              Icons.star_rounded,
                              Theme.of(context).colorScheme.primary,
                            ),
                            _buildVerticalDivider(context),
                            _buildShopStat(
                              context,
                              '2.5k+',
                              'Reviews',
                              Icons.message_rounded,
                              Theme.of(context).colorScheme.secondary,
                            ),
                            _buildVerticalDivider(context),
                            _buildShopStat(
                              context,
                              '15+',
                              'Services',
                              Icons.car_repair,
                              Theme.of(context).colorScheme.tertiary,
                            ),
                          ],
                        ),
                        const SizedBox(height: TUiConstants.defaultSpacing),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.store),
                                label: const Text('Visit Shop'),
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.all(TUiConstants.m),
                                ),
                              ),
                            ),
                            const SizedBox(width: TUiConstants.defaultSpacing),
                            Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                                borderRadius: BorderRadius.circular(
                                    TUiConstants.borderRadiusMedium),
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.phone),
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: TUiConstants.spaceBtwSections),

                  // Description
                  Text(
                    'Description',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: TUiConstants.defaultSpacing),
                  Text(
                    'Premium car wash service includes exterior wash, interior vacuum, dashboard cleaning, tire dressing, and window cleaning.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),

                  const SizedBox(height: TUiConstants.spaceBtwSections),

                  // Service Features
                  Wrap(
                    spacing: TUiConstants.defaultSpacing,
                    runSpacing: TUiConstants.defaultSpacing,
                    children: [
                      _buildFeatureChip(
                          context, '45 mins', TUiConstants.iconService),
                      _buildFeatureChip(
                          context, 'Free Pickup', TUiConstants.iconCar),
                      _buildFeatureChip(
                          context, 'Insured', TUiConstants.iconSuccess),
                    ],
                  ),

                  const SizedBox(height: TUiConstants.spaceBtwSections * 2),

                  // Service Details Sections
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Service Details',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      const SizedBox(height: TUiConstants.defaultSpacing),

                      // Exterior Services Card
                      _buildServiceDetailCard(
                        context,
                        'Exterior Services',
                        TUiConstants.iconCar,
                        [
                          'Pressure Washing',
                          'Hand Wash & Dry',
                          'Wheel & Tire Cleaning',
                          'Paint Protection',
                          'Window Cleaning',
                        ],
                      ),

                      const SizedBox(height: TUiConstants.defaultSpacing),

                      // Interior Services Card
                      _buildServiceDetailCard(
                        context,
                        'Interior Services',
                        TUiConstants.iconService,
                        [
                          'Vacuum Cleaning',
                          'Dashboard Wiping',
                          'Seat Deep Cleaning',
                          'Floor Mat Washing',
                          'AC Vent Cleaning',
                        ],
                      ),

                      const SizedBox(height: TUiConstants.defaultSpacing),

                      // Premium Add-ons Card
                      _buildServiceDetailCard(
                        context,
                        'Premium Add-ons',
                        TUiConstants.iconEngine,
                        [
                          'Wax Polishing',
                          'Ceramic Coating',
                          'Leather Treatment',
                          'Glass Treatment',
                          'Engine Bay Cleaning',
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(TUiConstants.defaultSpacing),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          boxShadow: [TShadowStyles.verticalShadow],
        ),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed('/schedule');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Theme.of(context).colorScheme.primaryContainer,
                  foregroundColor: Theme.of(context).colorScheme.primary,
                ),
                child: Text(
                  'Schedule',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                ),
              ),
            ),
            const SizedBox(width: TUiConstants.defaultSpacing),
            Expanded(
                child: CustomElevatedButton(onTap: () {}, text: "Book Now")),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureChip(BuildContext context, String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: TUiConstants.paddingMedium,
        vertical: TUiConstants.paddingSmall,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(TUiConstants.borderRadiusLarge),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: TUiConstants.iconSizeMedium,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: TUiConstants.s / 2),
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
        ],
      ),
    );
  }

  // Helper method for shop statistics
  Widget _buildShopStat(
    BuildContext context,
    String value,
    String label,
    IconData icon,
    Color color,
  ) {
    return Column(
      children: [
        Icon(icon, color: color),
        const SizedBox(height: TUiConstants.xl),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }

  Widget _buildVerticalDivider(BuildContext context) {
    return Container(
      height: 40,
      width: 1,
      color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
    );
  }

  // Helper method for service details
  Widget _buildServiceDetailCard(
    BuildContext context,
    String title,
    IconData icon,
    List<String> items,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(TUiConstants.borderRadiusLarge),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.1),
        ),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          leading: Container(
            padding: const EdgeInsets.all(TUiConstants.paddingSmall),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius:
                  BorderRadius.circular(TUiConstants.borderRadiusMedium),
            ),
            child: Icon(
              icon,
              color: Theme.of(context).colorScheme.primary,
              size: TUiConstants.iconSizeMedium,
            ),
          ),
          title: Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                TUiConstants.defaultSpacing,
                0,
                TUiConstants.defaultSpacing,
                TUiConstants.defaultSpacing,
              ),
              child: Column(
                children: items
                    .map((item) => Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: TUiConstants.paddingSmall / 2,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                TUiConstants.iconSuccess,
                                size: TUiConstants.iconSizeMedium,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              const SizedBox(width: TUiConstants.s),
                              Text(
                                item,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
