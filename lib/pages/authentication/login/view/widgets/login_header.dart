import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/constants.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/helpers/helper_functions.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FlutterLogo(size: 100),
        const SizedBox(height: TUiConstants.defaultSpacing),
        Text(
          TTextConstants.welcomeBack,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: TUiConstants.s),
        SizedBox(
          width: THelperFunctions.getDeviceWidth(context) * .8,
          child: Text(
            TTextConstants.loginDescription,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
