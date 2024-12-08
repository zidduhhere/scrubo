import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBarStateController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  RxList<String> filteredItems = <String>[].obs;

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
    super.onClose();
  }

  void _onSearchChanged() {
    final searchText = searchController.text;
    if (searchText.isEmpty) {
      filteredItems.clear();
      return;
    }

    filteredItems.value = searchItems
        .where((item) => item.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
  }

  void selectSearchItem(String item) {
    // Navigate to search results page with selected item
  }
}
