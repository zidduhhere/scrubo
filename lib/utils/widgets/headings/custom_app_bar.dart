import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/device/device_utility.dart';

class TCustomSimpleAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const TCustomSimpleAppbar({
    super.key,
    required this.title,
    this.leading,
    this.implyLeading = true,
    this.centerTile = false,
  });

  final String title;
  final IconData? leading;
  final bool implyLeading;
  final bool centerTile;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: implyLeading,
      centerTitle: centerTile,
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: Icon(leading ?? TUiConstants.iconBack),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.displayLarge!.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }

  @override
  Size get preferredSize => TDeviceUtility.getAppBarSize();
}
