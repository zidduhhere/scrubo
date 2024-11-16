import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:scrubo/pages/home/view/home_view_controller.dart';
import 'package:scrubo/pages/home/view/widgets/address_selection_widget.dart';
import 'package:scrubo/pages/home/view/widgets/categories_widget.dart';
import 'package:scrubo/pages/home/view/widgets/home_carousel.dart';
import 'package:scrubo/pages/home/view/widgets/product_grid.dart';
import 'package:scrubo/utils/constants/constants.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/device/device_utility.dart';
import 'package:scrubo/utils/widgets/custom_app_bar.dart';
import 'package:scrubo/utils/widgets/custom_row_header.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeViewController homeviewController = Get.put(HomeViewController());
    return GestureDetector(
      onTap: () => TDeviceUtility.hideKeyboard(context),
      child: Scaffold(
        //BODY
        body: Padding(
          padding:
              const EdgeInsets.fromLTRB(TUiConstants.s, 0, TUiConstants.s, 0),
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                Obx(
                  () => TCustomAppBar(
                    badgeIcon: Iconsax.shopping_bag,
                    title: TTextConstants.name,
                    titlemsg: TTextConstants.welcome,
                    badge: true,
                    badgeVal: homeviewController.badgeNumber.value,
                    badgeOnPresed: () {
                      homeviewController.badgeNumber.value++;
                      // Get.toNamed('/navigation');
                    },
                    profileIcon: true,
                    backgroundColor: Theme.of(context).colorScheme.surface,
                  ),
                ),
              ];
            },
            body: const SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AddressSelectionHeader(),
                  SizedBox(height: TUiConstants.defaultSpacing),
                  TSeachBox(),
                  SizedBox(height: TUiConstants.defaultSpacing),
                  //Offers Section
                  CustomHomeCarousel(),
                  SizedBox(height: TUiConstants.spaceBtwSections),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: TUiConstants.s,
                    ),
                    child: CustomRowHeader(
                        leadingText: TTextConstants.allCategories,
                        trailingText: TTextConstants.seeAll),
                  ),
                  SizedBox(height: TUiConstants.defaultSpacing),
                  CategoriesList(),
                  SizedBox(height: TUiConstants.defaultSpacing),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: TUiConstants.s,
                    ),
                    child: CustomRowHeader(
                      leadingText: TTextConstants.recommended,
                    ),
                  ),
                  // ProductGrid()
                  SizedBox(height: TUiConstants.defaultSpacing * 2),
                  // ProductViewGrid()
                  ProductViewGrid()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HorizontalProductViewCard extends StatelessWidget {
  const HorizontalProductViewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: double.maxFinite,
      decoration: BoxDecoration(
        boxShadow: [
          TShadowStyles.verticalShadow,
          TShadowStyles.horizontalShadow
        ],
      ),
    );
  }
}

class TSeachBox extends StatelessWidget {
  const TSeachBox({super.key});

  @override
  Widget build(BuildContext context) {
    // HomeViewController homeViewController = Get.find<HomeViewController>();
    // homeViewController.changeHint();
    return TextField(
      autocorrect: true,
      decoration: InputDecoration(
        prefixIcon: const Icon(Iconsax.search_normal),
        filled: true,
        // fillColor: TColors.lightSecondary.withOpacity(0.2),
        hintText: "Search Services",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(TUiConstants.borderRadiusMedium),
          borderSide: BorderSide.none, // Makes border transparent
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(TUiConstants.borderRadiusMedium),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(TUiConstants.borderRadiusMedium),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(TUiConstants.borderRadiusMedium),
          borderSide: BorderSide.none,
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(TUiConstants.borderRadiusMedium),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
