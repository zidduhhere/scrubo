import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrubo/pages/authentication/controllers/login/login_controller.dart';
import 'package:scrubo/utils/constants/constants.dart';

class RememberForgetRow extends StatelessWidget {
  const RememberForgetRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Obx(
          () => SizedBox(
            width: 32,
            height: 32,
            child: Checkbox(
              value: controller.rememberMe.value,
              onChanged: (value) {
                controller.rememberMe.value = value!;
              },
            ),
          ),
        ),
        Text(TTextConstants.rememberMe,
            style: Theme.of(context).textTheme.labelSmall),
      ],
    );
  }
}
