import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrubo/pages/home/viewmodel/home_view_controller.dart';
import 'package:scrubo/pages/home/view/widgets/address_selection_widget.dart';
import 'package:scrubo/pages/home/view/widgets/categories_widget.dart';
import 'package:scrubo/pages/home/view/widgets/home_carousel.dart';
import 'package:scrubo/utils/widgets/grids/product_grid.dart';
import 'package:scrubo/utils/constants/constants.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/device/device_utility.dart';
import 'package:scrubo/utils/widgets/custom_app_bar.dart';
import 'package:scrubo/utils/widgets/headings/custom_row_header.dart';
import 'package:scrubo/utils/widgets/textfield/custom_search_bar.dart';

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
          padding: TSpacingStyles.paddingScaffold,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                //APPBAR SECTION
                TCustomAppBar(
                  badgeIcon: TUiConstants.iconCart,
                  title: TTextConstants.name,
                  titlemsg: TTextConstants.welcome,
                  profileIcon: true,
                  backgroundColor: Theme.of(context).colorScheme.surface,
                ),
              ];
            },
            body: const SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //ADDRESS SELECTION SECTION
                  AddressSelectionHeader(),
                  SizedBox(height: TUiConstants.defaultSpacing),
                  //SEARCH SECTION
                  TSearchBox(),
                  SizedBox(height: TUiConstants.defaultSpacing),
                  //Offers Section
                  CustomHomeCarousel(),
                  SizedBox(height: TUiConstants.spaceBtwSections),
                  //CATEGORIES SECTION
                  CustomRowHeader(
                    leadingText: TTextConstants.allCategories,
                    isTrailing: false,
                  ),
                  SizedBox(height: TUiConstants.defaultSpacing),
                  CategoriesList(),
                  SizedBox(height: TUiConstants.defaultSpacing),
                  //TRENDING SECTION
                  Placeholder(
                    fallbackHeight: 400,
                    fallbackWidth: double.infinity,
                    child: Center(
                      child: Text('Trending Services'),
                    ),
                  ),
                  SizedBox(height: TUiConstants.spaceBtwSections),
                  //RECOMMENDED SECTION
                  CustomRowHeader(
                    leadingText: TTextConstants.recommended,
                    isTrailing: false,
                  ),

                  SizedBox(height: TUiConstants.defaultSpacing),

                  // ProductViewGrid()
                  ProductViewGrid(),
                  SizedBox(height: TUiConstants.spaceBtwSections * 2),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
