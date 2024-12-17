import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrubo/pages/products/model/product_model.dart';
import 'package:scrubo/pages/products/view/widgets/product_attributes.dart';
import 'package:scrubo/pages/products/view/widgets/product_image_slider.dart';
import 'package:scrubo/pages/products/view/widgets/product_metadata.dart';
import 'package:scrubo/pages/products/view/widgets/vehicle_selection.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/widgets/buttons/custom_elevated_button.dart';
import 'package:scrubo/utils/widgets/custom/custom_divider.dart';
import 'package:scrubo/utils/widgets/custom/custom_readmore_text.dart';
import 'package:scrubo/utils/widgets/custom/ratings_share_widget.dart';
import 'package:scrubo/utils/widgets/headings/custom_row_header.dart';

class ServiceDetailsView extends StatelessWidget {
  const ServiceDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final arguemnts = Get.arguments;
    final ProductModel product = arguemnts['product'];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// Product Image Slider
              TProductImageSlider(
                thumbnail: product.thumbnail,
                photoUrls: product.photoUrls,
              ),

              //Prodct Details

              Padding(
                padding: const EdgeInsets.fromLTRB(
                    TUiConstants.defaultSpacing,
                    0,
                    TUiConstants.defaultSpacing,
                    TUiConstants.defaultSpacing),
                child: Column(
                  children: [
                    ///Ratings& Share
                    const RatingsShareWidget(
                      rating: 4.5,
                      totalRatings: 199,
                    ),

                    ///Price, Title, Availabiltiy, Shop
                    TProductMetadata(
                      product: product,
                    ),

                    ///Attributes

                    TProductAttributes(product: product),

                    //Vehicle Selection

                    const TVehicleSelection(),

                    ///Checkout Button
                    SizedBox(
                      width: double.infinity,
                      child: CustomElevatedButton(
                          onTap: () => Get.toNamed('/schedule'),
                          text: 'Schedule'),
                    ),
                    const SizedBox(height: TUiConstants.spaceBtwSections),

                    ///Description
                    ///
                    const CustomRowHeader(
                        leadingText: 'Description', isTrailing: false),
                    const SizedBox(height: TUiConstants.defaultSpacing),
                    const TCustomReadMoreText(),
                    const SizedBox(height: TUiConstants.defaultSpacing),
                    const CustomDivider(),
                    const SizedBox(height: TUiConstants.spaceBtwSections),

                    ///Reviews
                    Row(
                      children: [
                        const CustomRowHeader(
                          leadingText: 'Reviews (199)',
                          isTrailing: false,
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              Get.toNamed('/serviceDetails/reviews');
                            },
                            icon: const Icon(TUiConstants.iconArrowRight))
                      ],
                    ),
                    const SizedBox(height: TUiConstants.spaceBtwSections),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
