import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/colors.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/widgets/containers/custom_rounded_containers.dart';
import 'package:scrubo/utils/widgets/headings/custom_price_text_views.dart';
import 'package:scrubo/utils/widgets/headings/custom_title_text_widget.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TRoundedContainer(
          padding: const EdgeInsets.all(TUiConstants.m),
          backgroundColor: TColors.lightSurfaceContainerHigh,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  const TTitleTextWidget(text: 'Variation'),
                  const SizedBox(width: TUiConstants.defaultSpacing),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const TTitleTextWidget(
                            text: 'Price:',
                            isSmall: true,
                          ),
                          const SizedBox(width: TUiConstants.spaceBtwTexts / 2),
                          StrikePriceTextWidget(
                            sign: TUiConstants.rupeeSign,
                            price: '3000',
                            priceStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  decoration: TextDecoration.lineThrough,
                                ),
                            signColor: TColors.lightOnSurface,
                          ),
                          const SizedBox(width: TUiConstants.spaceBtwTexts / 2),
                          PriceTextWidget(
                            price: '2500',
                            sign: TUiConstants.rupeeSign,
                            priceStyle:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const TTitleTextWidget(
                              text: 'Slot  :', isSmall: true),
                          const SizedBox(width: TUiConstants.spaceBtwTexts / 2),
                          Text(
                            'Available',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: TUiConstants.defaultSpacing),
              const TTitleTextWidget(
                text:
                    'This is a description of the product variation and other things related to the product.',
                isSmall: true,
              ),
              const SizedBox(height: TUiConstants.defaultSpacing),

              //Vehicle Selection

              // SizedBox(
              //   height: 120,
              //   child: ListView.separated(
              //       scrollDirection: Axis.horizontal,
              //       physics: const AlwaysScrollableScrollPhysics(),
              //       shrinkWrap: true,
              //       itemBuilder: (_, index) {
              //         return Column(
              //           children: [
              //             const SizedBox(
              //               height: 80,
              //               child: TRoundedImageContainer(
              //                 padding: EdgeInsets.all(TUiConstants.m),
              //                 bordeRadius: TUiConstants.borderRadiusMax,
              //                 backgroundColor:
              //                     TColors.lightSurfaceContainerLowest,
              //                 width: 50,
              //                 fit: BoxFit.contain,
              //                 isNetworkImage: false,
              //                 imageUrl: TImages.car,
              //               ),
              //             ),
              //             const SizedBox(height: TUiConstants.spaceBtwTexts),
              //             SizedBox(
              //               width: 80,
              //               child: Text('Hyunda i20',
              //                   overflow: TextOverflow.ellipsis,
              //                   textAlign: TextAlign.start,
              //                   style: Theme.of(context)
              //                       .textTheme
              //                       .labelSmall!
              //                       .copyWith(color: TColors.lightOnSurface)),
              //             ),
              //           ],
              //         );
              //       },
              //       separatorBuilder: (_, __) => const SizedBox(
              //             width: TUiConstants.spaceBtwTexts * 2,
              //           ),
              //       itemCount: 3),
              // ),
              // SizedBox(
              //   height: 100,
              //   child: ListView.separated(
              //       scrollDirection: Axis.horizontal,
              //       physics: const AlwaysScrollableScrollPhysics(),
              //       shrinkWrap: true,
              //       itemBuilder: (_, index) {
              //         return const TRoundedDecorationImageContainer(
              //           padding: EdgeInsets.all(TUiConstants.m),
              //           radius: 999,
              //           width: 90,
              //           borderColor: Colors.red,
              //           fit: BoxFit.contain,
              //           isNetworkImage: false,
              //           imageUrl: TImages.bike,
              //         );
              //       },
              //       separatorBuilder: (_, __) => const SizedBox(
              //             width: TUiConstants.spaceBtwTexts,
              //           ),
              //       itemCount: 3),
              // )
            ],
          ),
        ),
        const SizedBox(height: TUiConstants.spaceBtwSections),
      ],
    );
  }
}
