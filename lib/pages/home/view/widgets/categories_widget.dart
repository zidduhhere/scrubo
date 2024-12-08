import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrubo/pages/home/viewmodel/home_view_controller.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/helpers/helper_functions.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeViewController homeviewController = Get.find<HomeViewController>();

    return SizedBox(
      height: THelperFunctions.getDeviceHeight(context) * 0.125,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: homeviewController.categories.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: TUiConstants.m),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => Get.toNamed('/home/subcategory'),
                    child: CircleAvatar(
                      radius: 35,
                      backgroundColor: THelperFunctions.isDarkMode(context)
                          ? Colors.blueGrey[800]
                          : Colors.blueGrey[100],
                      foregroundColor: Theme.of(context).colorScheme.primary,
                      child: Image.asset(
                        homeviewController.categories[index]!['icon']!,
                        scale: 15,
                      ),
                    ),
                  ),
                  const SizedBox(height: TUiConstants.s),
                  Text(
                    homeviewController.categories[index]!['title']!,
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
