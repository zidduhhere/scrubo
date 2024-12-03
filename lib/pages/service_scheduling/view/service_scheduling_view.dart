// service_scheduling_controller.dart
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:scrubo/pages/service_scheduling/viewmodel/service_scheduling_controller.dart';
import 'package:scrubo/utils/constants/constants.dart';
import 'package:scrubo/utils/constants/image_strings.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/widgets/custom_app_bar.dart';

// service_scheduling_view.dart

class ServiceSchedulingView extends StatelessWidget {
  const ServiceSchedulingView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ServiceSchedulingController());

    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.fromLTRB(TUiConstants.s, 0, TUiConstants.s, 0),
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            TCustomAppBar(
              profileIcon: true,
              title: TTextConstants.name,
              titlemsg: TTextConstants.welcome,
              backgroundColor: Theme.of(context).colorScheme.surface,
              leading: true,
            ),
          ],
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(TUiConstants.defaultSpacing),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Compact Service Card
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius:
                          BorderRadius.circular(TUiConstants.borderRadiusLarge),
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
                        // Service Image and Quick Edit
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(
                                    TUiConstants.borderRadiusLarge),
                                topRight: Radius.circular(
                                    TUiConstants.borderRadiusLarge),
                              ),
                              child: Image.asset(
                                TImages.carWashService,
                                height: 120,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 8,
                              right: 8,
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.edit),
                                style: IconButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.surface,
                                  foregroundColor:
                                      Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ),
                          ],
                        ),

                        // Service Info
                        Padding(
                          padding:
                              const EdgeInsets.all(TUiConstants.defaultSpacing),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.serviceTitle,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    const SizedBox(height: TUiConstants.xl),
                                    Text(
                                      '45 mins • 4.8 ★',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: TUiConstants.xl,
                                  vertical: TUiConstants.xl,
                                ),
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                  borderRadius: BorderRadius.circular(
                                      TUiConstants.borderRadiusLarge),
                                ),
                                child: Text(
                                  '₹${controller.price}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimaryContainer,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: TUiConstants.defaultSpacing),

                  TextButton.icon(
                    onPressed: () => controller.changeService(),
                    icon: const Icon(Icons.swap_horiz),
                    label: Text(
                      'Change Service',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: TUiConstants.defaultSpacing,
                        vertical: TUiConstants.m,
                      ),
                      backgroundColor: Theme.of(context)
                          .colorScheme
                          .primaryContainer
                          .withOpacity(0.1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            TUiConstants.borderRadiusMedium),
                      ),
                    ),
                  ),

                  const SizedBox(height: TUiConstants.spaceBtwSections),

                  // Date Selection
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.availableDates.length,
                      itemBuilder: (context, index) {
                        final date = controller.availableDates[index];
                        return Obx(() => GestureDetector(
                              onTap: () => controller.selectDate(date),
                              child: Container(
                                width: TUiConstants.smallContainerWidth / 2,
                                margin: const EdgeInsets.only(
                                    right: TUiConstants.s),
                                decoration: BoxDecoration(
                                  color: controller.isDateSelected(date)
                                      ? Theme.of(context).colorScheme.primary
                                      : Theme.of(context).colorScheme.surface,
                                  borderRadius: BorderRadius.circular(
                                      TUiConstants.borderRadiusMedium),
                                  border: Border.all(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .outline
                                        .withOpacity(0.1),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      controller.getWeekDay(date),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color:
                                                controller.isDateSelected(date)
                                                    ? Theme.of(context)
                                                        .colorScheme
                                                        .onPrimary
                                                    : null,
                                          ),
                                    ),
                                    Text(
                                      date.day.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color:
                                                controller.isDateSelected(date)
                                                    ? Theme.of(context)
                                                        .colorScheme
                                                        .onPrimary
                                                    : null,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ));
                      },
                    ),
                  ),

                  const SizedBox(height: TUiConstants.spaceBtwSections),

                  // Time Selection
                  SizedBox(
                    height: TUiConstants.smallContainerHeight,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.availableTimes.length,
                      itemBuilder: (context, index) {
                        final time = controller.availableTimes[index];
                        return Obx(() => GestureDetector(
                              onTap: () => controller.selectTime(time),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: TUiConstants.defaultSpacing,
                                ),
                                margin: const EdgeInsets.only(
                                    right: TUiConstants.m),
                                decoration: BoxDecoration(
                                  color: controller.isTimeSelected(time)
                                      ? Theme.of(context).colorScheme.primary
                                      : Theme.of(context).colorScheme.surface,
                                  borderRadius: BorderRadius.circular(
                                      TUiConstants.borderRadiusMedium),
                                  border: Border.all(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .outline
                                        .withOpacity(0.1),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    controller.formatTime(time),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: controller.isTimeSelected(time)
                                              ? Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary
                                              : null,
                                        ),
                                  ),
                                ),
                              ),
                            ));
                      },
                    ),
                  ),

                  const SizedBox(height: TUiConstants.spaceBtwSections * 2),

                  // Confirm Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: controller.scheduleService,
                      style: ElevatedButton.styleFrom(
                        padding:
                            const EdgeInsets.all(TUiConstants.defaultSpacing),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                      ),
                      child: const Text('Confirm Schedule'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
