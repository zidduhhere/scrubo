import 'package:flutter/material.dart';
import 'package:scrubo/pages/personalization/models/vehicle_model.dart';
import 'package:scrubo/utils/constants/colors.dart';
import 'package:scrubo/utils/constants/image_strings.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/widgets/containers/custom_rounded_containers.dart';
import 'package:scrubo/utils/widgets/headings/custom_title_text_widget.dart';

class TSingleVehicle extends StatelessWidget {
  const TSingleVehicle({
    super.key,
    required this.onPressed,
    required this.isSelected,
    required this.model,
  });
  final bool isSelected;
  final VoidCallback onPressed;
  final VehicleModel model;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TRoundedContainer(
        margin: const EdgeInsets.only(bottom: TUiConstants.defaultSpacing),
        backgroundColor:
            isSelected ? TColors.lightSecondaryContainer : TColors.lightSurface,
        padding: const EdgeInsets.all(TUiConstants.m),
        border: isSelected
            ? null
            : Border.all(color: TColors.lightSecondary.withAlpha(1)),
        onPressed: onPressed,
        child: Stack(
          children: [
            Positioned(
                right: 0,
                top: 0,
                child: IconButton(
                    splashColor: TColors.lightPrimaryContainer,
                    onPressed: onPressed,
                    icon: const Icon(TUiConstants.iconEdit))),
            Positioned(
                right: 10,
                child: isSelected
                    ? const Icon(
                        TUiConstants.iconCheck,
                        color: TColors.lightPrimaryColor,
                      )
                    : const SizedBox()),
            Positioned(
              child: Image.asset(
                TImages.car,
                height: 100,
                width: 100,
              ),
            ),
            Positioned(
              left: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TTitleTextWidget(
                    text: model.registrationNumber,
                    isSmall: true,
                  ),
                  TTitleTextWidget(text: model.model),
                  const SizedBox(height: TUiConstants.spaceBtwTexts),
                  TTitleTextWidget(text: model.company, isSmall: true),
                  const SizedBox(height: TUiConstants.spaceBtwTexts / 2),
                  Row(
                    children: [
                      TTitleTextWidget(text: model.type, isSmall: true),
                      const SizedBox(width: TUiConstants.spaceBtwTexts),
                      TTitleTextWidget(text: model.color, isSmall: true),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
