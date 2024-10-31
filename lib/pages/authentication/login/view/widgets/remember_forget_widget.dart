import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrubo/utils/constants/colors.dart';
import 'package:scrubo/utils/constants/constants.dart';

class RememberForgetRow extends StatelessWidget {
  const RememberForgetRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: true,
          onChanged: (value) {
            value = value;
            Get.snackbar('Message', 'Authentication Succesful',
                colorText: TColors.lightOnTertiaryContainer,
                backgroundColor: TColors.lightTertiaryContainer,
                shouldIconPulse: true,
                snackStyle: SnackStyle.FLOATING);
          },
        ),
        Text(TTextConstants.rememberMe,
            style: Theme.of(context).textTheme.labelMedium!),
      ],
    );
  }
}
