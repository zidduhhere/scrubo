import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:scrubo/pages/home/viewmodel/home_search_bar_controller.dart';
import 'package:scrubo/utils/constants/constants.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

// custom_search_bar.dart
class TSearchBox extends StatelessWidget {
  const TSearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    SearchBarStateController controller = Get.put(SearchBarStateController());

    return Column(
      children: [
        TextField(
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.w400,
              ),
          controller: controller.searchController,
          onSubmitted: (value) => controller.selectSearchItem(value),
          decoration: InputDecoration(
            prefixIcon: const Icon(TUiConstants.iconSearch),
            filled: true,
            fillColor:
                Theme.of(context).colorScheme.surfaceContainer.withOpacity(1),
            hintText: TTextConstants.searchServices,
            enabledBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(TUiConstants.borderRadiusMedium),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(TUiConstants.borderRadiusMedium),
              borderSide: BorderSide.none,
            ),
            border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(TUiConstants.borderRadiusMedium),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        Obx(() {
          if (controller.filteredItems.isNotEmpty) {
            return Container(
              margin: const EdgeInsets.only(top: 4),
              constraints: const BoxConstraints(maxHeight: 200),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius:
                    BorderRadius.circular(TUiConstants.borderRadiusMedium),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: controller.filteredItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    dense: true,
                    title: Text(controller.filteredItems[index]),
                    onTap: () => controller.selectSearchItem(
                      controller.filteredItems[index],
                    ),
                  );
                },
              ),
            );
          }
          return const SizedBox.shrink();
        }),
      ],
    );
  }
}
