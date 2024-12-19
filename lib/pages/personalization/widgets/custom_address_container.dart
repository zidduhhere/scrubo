import 'package:flutter/material.dart';
import 'package:scrubo/pages/personalization/models/address_model.dart';
import 'package:scrubo/utils/constants/colors.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/device/device_utility.dart';
import 'package:scrubo/utils/formatter/phone_number_formatter.dart';
import 'package:scrubo/utils/widgets/containers/custom_rounded_containers.dart';
import 'package:scrubo/utils/widgets/headings/custom_title_text_widget.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress(
      {super.key,
      required this.onPressed,
      required this.isSelected,
      required this.model});
  final bool isSelected;
  final VoidCallback onPressed;
  final AddressModel model;
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
            : Border.all(color: TColors.lightSecondary.withAlpha(4)),
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
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TTitleTextWidget(
                    text: model.type,
                    isSmall: true,
                  ),
                  TTitleTextWidget(text: model.name),
                  const SizedBox(height: TUiConstants.spaceBtwTexts),
                  TTitleTextWidget(
                      text: TPhoneNumberFormatter.addCountryCode(
                          model.phoneNumber),
                      isSmall: true),
                  const SizedBox(height: TUiConstants.spaceBtwTexts / 2),
                  SizedBox(
                    width: TDeviceUtility.getDeviceWidth(context) * .7,
                    child: TTitleTextWidget(
                      text:
                          "${model.address} ${model.city} ${model.state} ${model.postalCode}",
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
