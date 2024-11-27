import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrubo/pages/home/viewmodel/home_view_controller.dart';
import 'package:scrubo/pages/home/view/widgets/address_selection_widget.dart';
import 'package:scrubo/pages/home/view/widgets/categories_widget.dart';
import 'package:scrubo/pages/home/view/widgets/home_carousel.dart';
import 'package:scrubo/pages/home/view/widgets/product_grid.dart';
import 'package:scrubo/utils/constants/constants.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/device/device_utility.dart';
import 'package:scrubo/utils/widgets/custom_app_bar.dart';
import 'package:scrubo/utils/widgets/custom_row_header.dart';
import 'package:scrubo/utils/widgets/custom_search_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
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
                TCustomAppBar(
                  badgeIcon: TUiConstants.iconCart,
                  title: TTextConstants.name,
                  titlemsg: TTextConstants.welcome,
                  // badge: true,
                  // badgeVal: homeviewController.badgeNumber.value,
                  // badgeOnPresed: () {
                  //   homeviewController.badgeNumber.value++;
                  //   // Get.toNamed('/navigation');
                  // },
                  profileIcon: true,
                  backgroundColor: Theme.of(context).colorScheme.surface,
                ),
              ];
            },
            body: const SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AddressSelectionHeader(),
                  SizedBox(height: TUiConstants.defaultSpacing),
                  TSearchBox(),
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
                  ProductViewGrid(),
                  SizedBox(height: TUiConstants.defaultSpacing * 2),
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
