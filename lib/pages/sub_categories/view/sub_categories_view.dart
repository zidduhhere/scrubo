import 'package:flutter/material.dart';
import 'package:scrubo/pages/sub_categories/widgets/product_category_container.dart';
import 'package:scrubo/utils/constants/colors.dart';
import 'package:scrubo/utils/constants/image_strings.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/widgets/containers/custom_rounded_containers.dart';
import 'package:scrubo/utils/widgets/headings/custom_app_bar.dart';
import 'package:scrubo/utils/widgets/headings/custom_row_header.dart';

class SubCategoriesView extends StatelessWidget {
  const SubCategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TCustomSimpleAppbar(title: 'Washing Services'),
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyles.paddingDefault,
          child: Column(
            children: [
              //Sub Categories Carousel
              SizedBox(height: TUiConstants.spaceBtwSections),
              TRoundedDecorationImageContainer(
                height: 200,
                borderColor: TColors.lightSurfaceContainerHigh,
                imageUrl: TImages.carousel1,
                isNetworkImage: false,
                radius: 30,
              ),
              SizedBox(height: TUiConstants.spaceBtwSections),
              CustomRowHeader(
                leadingText: 'Trending Services',
                isTrailing: true,
                trailingText: 'View all',
              ),
              SizedBox(height: TUiConstants.defaultSpacing),
              TCategoriesLayoutBuilder(),
              SizedBox(height: TUiConstants.spaceBtwSections),
              //Category Heading
              CustomRowHeader(
                leadingText: 'Car Washes',
                isTrailing: true,
                trailingText: 'View all',
              ),
              SizedBox(height: TUiConstants.defaultSpacing),

              //Category Product Container
              TCategoriesLayoutBuilder(),
              SizedBox(height: TUiConstants.spaceBtwSections),
              CustomRowHeader(
                leadingText: 'Bike Washes',
                isTrailing: true,
                trailingText: 'View all',
              ),
              SizedBox(height: TUiConstants.defaultSpacing),
              TCategoriesLayoutBuilder(),
              SizedBox(height: TUiConstants.spaceBtwSections * 3),
            ],
          ),
        ),
      ),
    );
  }
}

class TCategoriesLayoutBuilder extends StatelessWidget {
  const TCategoriesLayoutBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return SizedBox(
          height: 140,
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              width: TUiConstants.defaultSpacing,
            ),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (_, index) {
              return const TCategoryProductContainer(
                title: 'Car Wash',
                price: '200',
                discount: '10',
                shopAddress: 'Shop 1, 2nd Floor, 3rd Building',
              );
            },
            itemCount: 5,
          ),
        );
      },
    );
  }
}
