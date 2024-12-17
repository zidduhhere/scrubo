import 'package:flutter/material.dart';
import 'package:scrubo/pages/home/controllers/category_controller.dart';
import 'package:scrubo/utils/device/device_utility.dart';

class CustomTabView extends StatelessWidget implements PreferredSizeWidget {
  const CustomTabView({
    super.key,
  });

  @override
  Size get preferredSize => TDeviceUtility.getAppBarSize();

  @override
  Widget build(BuildContext context) {
    final CategoryController categoryController = CategoryController.instance;
    return Material(
      color: Theme.of(context).colorScheme.surface,
      child: TabBar(
        padding: EdgeInsets.zero,
        unselectedLabelColor: Theme.of(context).colorScheme.secondary,
        labelStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.w600,
            ),
        indicatorWeight: 1,
        dividerColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        tabAlignment: TabAlignment.start,
        isScrollable: true,
        tabs: List.generate(categoryController.categories.length, (index) {
          return Tab(
            text: categoryController.categories[index].name,
          );
        }),
      ),
    );
  }
}
