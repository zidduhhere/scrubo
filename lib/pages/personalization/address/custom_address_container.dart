import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/colors.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/device/device_utility.dart';
import 'package:scrubo/utils/widgets/containers/custom_rounded_containers.dart';
import 'package:scrubo/utils/widgets/headings/custom_title_text_widget.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({
    super.key,
    required this.onPressed,
    required this.isSelected,
  });
  final bool isSelected;
  final VoidCallback onPressed;
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
            : Border.all(color: TColors.lightSecondary.withOpacity(.4)),
        onPressed: onPressed,
        child: Stack(
          children: [
            Positioned(
                right: 10,
                child: isSelected
                    ? const Icon(
                        TUiConstants.iconCheck,
                        color: TColors.lightPrimaryColor,
                      )
                    : const SizedBox()),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TTitleTextWidget(
                    text: 'Home',
                    isSmall: true,
                  ),
                  const TTitleTextWidget(text: 'John Doe'),
                  const SizedBox(height: TUiConstants.spaceBtwTexts),
                  const TTitleTextWidget(text: '+91 7306522615', isSmall: true),
                  const SizedBox(height: TUiConstants.spaceBtwTexts / 2),
                  SizedBox(
                    width: TDeviceUtility.getDeviceWidth(context) * .7,
                    child: const TTitleTextWidget(
                      text:
                          'B S Nivas Thalikuzhy, Thalikuzhy P.O 695612, Trivandrum, Trivandrum Kerala',
                      isSmall: true,
                    ),
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
