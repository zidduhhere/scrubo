import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrubo/utils/constants/colors.dart';
import 'package:scrubo/utils/constants/image_strings.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/widgets/containers/custom_rounded_containers.dart';
import 'package:scrubo/utils/widgets/custom/shapes/curved_edge_widget.dart';
import 'package:scrubo/utils/widgets/headings/custom_row_icon_header.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
        height: 400,
        color: Colors.transparent,
        child: SizedBox(
          child: Stack(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(TUiConstants.paddingImage),
                  child: SizedBox(
                    height: 300,
                    child: Image.asset(
                      TImages.carSpa,
                      fit: BoxFit.contain,
                      scale: 1.5,
                    ),
                  ),
                ),
              ),
              //Image Slider Builder
              Positioned(
                bottom: 30,
                right: 30,
                left: TUiConstants.defaultSpacing,
                child: SizedBox(
                  height: 80,
                  child: ListView.separated(
                    itemCount: 6,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    separatorBuilder: (_, __) => const SizedBox(
                      width: TUiConstants.defaultSpacing,
                    ),
                    itemBuilder: (_, index) {
                      List<String> images = [
                        TImages.carSpa,
                        TImages.carWashService,
                        TImages.tyresCar,
                        TImages.carRepair,
                        TImages.carTowing,
                        TImages.carOilChange
                      ];
                      return TRoundedImageContainer(
                        backgroundColor: Colors.white,
                        height: 80,
                        width: 80,
                        border: Border.all(
                          color: TColors.lightOutline.withOpacity(.3),
                          width: 1,
                        ),
                        isNetworkImage: false,
                        imageUrl: images[index],
                      );
                    },
                  ),
                ),
              ),
              //AppBar Icons
              Positioned(
                child: RowIconButtons(
                  leading: TUiConstants.iconBack,
                  leaddingPressed: () {
                    Get.back();
                  },
                  trailing: TUiConstants.iconFavourite,
                  trailingPressed: () {},
                  trailingColor: Colors.blue,
                ),
              )
            ],
          ),
        ));
  }
}
