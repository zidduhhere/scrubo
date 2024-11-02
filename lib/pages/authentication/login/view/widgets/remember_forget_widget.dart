import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrubo/pages/authentication/login/viewmodel/login_controller.dart';
import 'package:scrubo/utils/constants/constants.dart';

class RememberForgetRow extends StatelessWidget {
  const RememberForgetRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    return Row(
      children: [
        Obx(
          () => Checkbox(
            value: controller.rememberMe.value,
            onChanged: (value) {
              controller.rememberMe.value = value!;
            },
          ),
        ),
        Text(TTextConstants.rememberMe,
            style: Theme.of(context).textTheme.labelMedium!),
      ],
    );
  }
}
