import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrubo/utils/constants/colors.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/widgets/containers/circukar_image_container.dart';

class ProfileInfoContainer extends StatelessWidget {
  const ProfileInfoContainer({
    super.key,
    required this.name,
    required this.email,
    required this.imageUrl,
  });
  final String name;
  final String email;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(TUiConstants.s),
      leading: TCircualrImage(width: 60, height: 60, imageUrl: imageUrl),
      title: Text(
        name,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: TColors.lightOnPrimary,
            ),
      ),
      subtitle: Text(
        email,
        style: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: TColors.lightOnPrimary,
            ),
      ),
      trailing: IconButton(
          onPressed: () => Get.toNamed('/profile'),
          icon: const Icon(
            TUiConstants.iconEdit,
            color: TColors.lightOnPrimary,
          )),
    );
  }
}
