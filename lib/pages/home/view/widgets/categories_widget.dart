import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrubo/pages/home/view/home_view_controller.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeViewController homeviewController = Get.find<HomeViewController>();
    return SizedBox(
      height: 100,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: homeviewController.categories.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: TUiConstants.m),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: homeviewController
                        .categories[index]!['backgroundColor'],
                    child:
                        Icon(homeviewController.categories[index]!['iconData']),
                  ),
                  const SizedBox(height: TUiConstants.s),
                  Text(
                    homeviewController.categories[index]!['title']!,
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
