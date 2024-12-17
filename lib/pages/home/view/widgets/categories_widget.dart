import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrubo/pages/home/controllers/category_controller.dart';
import 'package:scrubo/pages/home/view/widgets/categories_rounded_image_container.dart';
import 'package:scrubo/pages/sub_categories/models/category_model.dart';
import 'package:scrubo/utils/constants/colors.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/device/device_utility.dart';
import 'package:scrubo/utils/widgets/grids/custom_categories_shimmer.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final CategoryController categoryController = Get.put(CategoryController());
    return Obx(
      () {
        if (categoryController.isLoading.value) {
          return const TCategoryShimmer();
        }

        if (categoryController.featuredCategories.isEmpty) {
          return Center(
            child: Text(
              "Data not found !",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: TColors.lightError),
            ),
          );
        }
        return SizedBox(
          height: TDeviceUtility.getDeviceHeight(context) * .13,
          child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: categoryController.featuredCategories.length,
              separatorBuilder: (_, __) {
                return const SizedBox(width: TUiConstants.defaultSpacing * 2);
              },
              itemBuilder: (context, index) {
                final category = categoryController.featuredCategories[index];
                return CategoryWidget(
                  category: category,
                  onTap: () => Get.toNamed('/home/subcategory'),
                );
              }),
        );
      },
    );
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget(
      {super.key, required this.category, required this.onTap});

  final CategoryModel category;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: category.image.isEmpty
              ? const Icon(TUiConstants.iconWarning)
              : CategoriesImageContainer(
                  width: 40,
                  height: 40,
                  imageUrl: category.image,
                  isNetworkImage: true,
                ),
        ),
        const SizedBox(height: TUiConstants.s),

        //Text
        Text(
          category.name,
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: Theme.of(context).colorScheme.outline,
              ),
        ),
      ],
    );
  }
}
