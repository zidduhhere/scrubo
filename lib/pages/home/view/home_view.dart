import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrubo/data/repositories/user/user_controller.dart';
import 'package:scrubo/pages/home/view/widgets/address_selection_widget.dart';
import 'package:scrubo/pages/home/view/widgets/categories_widget.dart';
import 'package:scrubo/pages/home/view/widgets/home_carousel.dart';
import 'package:scrubo/pages/home/viewmodel/home_view_controller.dart';
import 'package:scrubo/pages/products/controllers/products_controller.dart';
import 'package:scrubo/utils/widgets/containers/custom_shimmer.dart';
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
    final HomeViewController homeviewController = Get.put(HomeViewController());
    final productController = Get.put(ProductsController());
    final userController = Get.put(UserController());
    return GestureDetector(
      onTap: () => TDeviceUtility.hideKeyboard(context),
      child: Scaffold(
        //BODY
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              //APPBAR SECTION
              Obx(
                () {
                  if (userController.profileLoading.value) {
                    return const SliverToBoxAdapter(
                      child: TShimmerEffect(
                        width: double.infinity,
                        height: TUiConstants.appBarheight * 1.5,
                      ),
                    );
                  }
                  return TCustomAppBar(
                    badgeIcon: TUiConstants.iconCart,
                    title: userController.user.value.fullName,
                    titlemsg: TTextConstants.welcome,
                    profileIcon: true,
                    isProfileImage: true,
                    imageUrl: userController.user.value.photoUrl,
                    backgroundColor: Theme.of(context).colorScheme.surface,
                  );
                },
              ),
            ];
          },
          body: const Padding(
            padding: TSpacingStyles.paddingScaffold,
            child: SingleChildScrollView(
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
