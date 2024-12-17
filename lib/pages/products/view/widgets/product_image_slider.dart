// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:scrubo/utils/constants/colors.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/widgets/cards/custom_cached_image.dart';
import 'package:scrubo/utils/widgets/containers/custom_rounded_containers.dart';
import 'package:scrubo/utils/widgets/custom/shapes/curved_edge_widget.dart';
import 'package:scrubo/utils/widgets/headings/custom_row_icon_header.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
    required this.thumbnail,
    required this.photoUrls,
  });
  final String thumbnail;
  final List<String> photoUrls;

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
                  child: Hero(
                    tag: 'thumbnail',
                    child: SizedBox(
                      height: 300,
                      child: TCachedNetworkImage(
                        isNetworkImage: true,
                        image: thumbnail,
                      ),
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
                    clipBehavior: Clip.none,
                    controller: ScrollController(
                      initialScrollOffset: (photoUrls.length > 2) ? 10 : 1000,
                    ),
                    itemCount: photoUrls.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    separatorBuilder: (_, __) => const SizedBox(
                      width: TUiConstants.defaultSpacing,
                    ),
                    itemBuilder: (_, index) {
                      List<String> images = photoUrls;
                      return GestureDetector(
                        onTap: () {},
                        child: TRoundedImageContainer(
                          backgroundColor: Colors.white,
                          height: 80,
                          width: 80,
                          border: Border.all(
                            color: TColors.lightOutline.withOpacity(.3),
                            width: 1,
                          ),
                          isNetworkImage: true,
                          fit: BoxFit.cover,
                          imageUrl: images[index],
                        ),
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
