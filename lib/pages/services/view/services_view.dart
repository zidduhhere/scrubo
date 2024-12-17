import 'package:flutter/material.dart';
import 'package:scrubo/pages/home/controllers/category_controller.dart';
import 'package:scrubo/pages/services/view/widgets/custom_tabbar_view.dart';
import 'package:scrubo/pages/services/view/widgets/featured_card_view.dart';
import 'package:scrubo/utils/constants/constants.dart';
import 'package:scrubo/utils/constants/image_strings.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/device/device_utility.dart';
import 'package:scrubo/utils/widgets/custom_app_bar.dart';
import 'package:scrubo/utils/widgets/grids/custom_grid.dart';
import 'package:scrubo/utils/widgets/cards/custom_horizontal_card_view.dart';
import 'package:scrubo/utils/widgets/headings/custom_row_header.dart';
import 'package:scrubo/utils/widgets/textfield/custom_search_bar.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = CategoryController.instance;
    TDeviceUtility.setStatusBarTextColor(true);
    return DefaultTabController(
      length: categoryController.categories.length,
      child: Scaffold(
        appBar: const TCustomNormalAppBar(
            profileIcon: true, title: 'Services', titlemsg: 'Welcome to'),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                centerTitle: false,
                backgroundColor: Colors.white,
                floating: true,
                expandedHeight: TDeviceUtility.getDeviceHeight(context) * .6,
                flexibleSpace: Padding(
                  padding: TSpacingStyles.paddingScaffold,
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const SizedBox(
                          height: TUiConstants.spaceBtwSections * 2.5),
                      const TSearchBox(),
                      const SizedBox(height: TUiConstants.spaceBtwSections),

                      //Feature Services
                      CustomRowHeader(
                        leadingText: TTextConstants.featureServices,
                        trailingText: TTextConstants.seeAll,
                        isTrailing: true,
                        action: () {},
                      ),
                      const SizedBox(height: TUiConstants.spaceBtwSections),
                      TGridView(
                        itemCount: categoryController.featuredCategories.length,
                        itemBuilder: (_, index) {
                          final image = categoryController
                              .featuredCategories[index].image;
                          final title =
                              categoryController.featuredCategories[index].name;
                          final subtitle =
                              featuredServices[index]?['subtitle'] ?? '';
                          return FeaturedServiceCard(
                            isNetworkImage: true,
                            image: image,
                            title: title,
                            subtitle: subtitle,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                bottom: const CustomTabView(),
              ),
            ];
          },
          body: const TabBarView(
            children: [
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: 6,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        itemBuilder: (_, index) {
          return const HorizontalTabViewCard();
        });
  }
}

final Map<int, Map<String, dynamic>> featuredServices = {
  0: {
    'image': TImages.colorIconCarWash,
    'title': 'Polishing',
    'subtitle': '10 shops nearby'
  },
  1: {
    'image': TImages.colorIconCarService,
    'title': 'Service',
    'subtitle': '8 shops nearby'
  },
  2: {
    'image': TImages.colorIconBreakCheck,
    'title': 'Brake Check',
    'subtitle': '5 shops nearby'
  },
  3: {
    'image': TImages.colorIconOilChange,
    'title': 'Oil Change',
    'subtitle': '12 shops nearby'
  },
  4: {
    'image': TImages.colorIconFlatTyre,
    'title': 'Flat Tyres',
    'subtitle': '10 shops nearby'
  },
  5: {
    'image': TImages.colorIconRepair,
    'title': 'Vehicle Repair',
    'subtitle': '8 shops nearby'
  },
  6: {
    'image': TImages.colorIconRepair,
    'title': 'Vehicle Repair',
    'subtitle': '8 shops nearby'
  },
};
