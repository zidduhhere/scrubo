import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:scrubo/pages/authentication/signup/viewmodel/signup_controller.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

class ThemeToggleIconButton<T extends GetxController> extends StatelessWidget {
  const ThemeToggleIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SignupController controller = Get.find<SignupController>();
    return GestureDetector(
      onTap: () {
        controller.toggleTheme();
      },
      child: Padding(
        padding: const EdgeInsets.only(right: TUiConstants.l),
        child: Icon(controller.isDarkMode.value ? Iconsax.moon : Iconsax.sun_1),
      ),
    );
  }
}
