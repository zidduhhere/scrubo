import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrubo/pages/authentication/controllers/signup/signup_controller.dart';
import 'package:scrubo/utils/constants/constants.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

class TermsAndConditionsWidget extends StatelessWidget {
  const TermsAndConditionsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SignupController controller = SignupController.instance;
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
            () => Checkbox(
              value: controller.agreeTerms.value,
              materialTapTargetSize: MaterialTapTargetSize.padded,
              onChanged: (_) {
                controller.agreeTerms.value = !controller.agreeTerms.value;
              },
            ),
          ),
        ),
        const SizedBox(width: TUiConstants.defaultSpacing),
        Expanded(
          flex: 1,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: "${TTextConstants.iAgree} ",
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: TTextConstants.privacyPolicy,
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: Theme.of(context)
                            .colorScheme
                            .primary, // Change to your desired color
                        decorationStyle: TextDecorationStyle.dashed)),
                TextSpan(
                    text: " ${TTextConstants.and} ",
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: TTextConstants.termsAndConditions,
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: Theme.of(context)
                            .colorScheme
                            .primary, // Change to your desired color
                        decorationStyle: TextDecorationStyle.dashed)),
              ],
            ),
          ),
        )
      ],
    );
  }
}
