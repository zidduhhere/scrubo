import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

class SearchBarStateController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  final LayerLink layerLink = LayerLink();

  // Observable variables
  RxBool showResults = false.obs;
  RxList<String> filteredItems = <String>[].obs;
  OverlayEntry? overlayEntry;

  // Sample data
  final List<String> searchItems = [
    'Car Wash',
    'Oil Change',
    'Tire Service',
    'Battery Check',
    'Engine Service',
  ];

  @override
  void onInit() {
    super.onInit();
    searchController.addListener(_onSearchChanged);
  }

  @override
  void onClose() {
    searchController.dispose();
    overlayEntry?.remove();
    super.onClose();
  }

  void _onSearchChanged() {
    final searchText = searchController.text;
    if (searchText.isEmpty) {
      hideOverlay();
      return;
    }

    filteredItems.value = searchItems
        .where((item) => item.toLowerCase().contains(searchText.toLowerCase()))
        .toList();

    if (filteredItems.isNotEmpty) {
      showOverlay();
    } else {
      hideOverlay();
    }
  }

  void showOverlay() {
    overlayEntry?.remove();
    showResults.value = true;
  }

  void hideOverlay() {
    overlayEntry?.remove();
    overlayEntry = null;
    showResults.value = false;
  }

  void selectItem(String item) {
    searchController.text = item;
    hideOverlay();
  }
}

// custom_search_bar.dart

class TSearchBox extends StatelessWidget {
  const TSearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    SearchBarStateController controller = Get.put(SearchBarStateController());

    return Column(
      children: [
        CompositedTransformTarget(
          link: controller.layerLink,
          child: TextField(
            controller: controller.searchController,
            autocorrect: true,
            onChanged: (_) => controller.showOverlay(),
            decoration: InputDecoration(
              prefixIcon: const Icon(TUiConstants.iconSearch),
              filled: true,
              fillColor: Theme.of(context).colorScheme.outline.withOpacity(.3),
              hintText: "Search Services",
              border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(TUiConstants.borderRadiusMedium),
                borderSide: BorderSide.none,
              ),
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
            ),
          ),
        ),
        Obx(() {
          if (controller.showResults.value) {
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
                    onTap: () =>
                        controller.selectItem(controller.filteredItems[index]),
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
