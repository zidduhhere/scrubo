import 'package:flutter/material.dart';
import 'package:scrubo/pages/personalization/widgets/settings_tile.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

class ChangableProfileTiles extends StatelessWidget {
  const ChangableProfileTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TSettingsTile(
          icon: TUiConstants.iconLocation,
          title: 'Geo Location',
          subtitle: 'Set recommendation based on location',
          trailing: Switch(value: true, onChanged: (value) {}),
        ),
        TSettingsTile(
          icon: TUiConstants.iconSafe,
          title: 'Safe Mode',
          subtitle: 'Search for safe services',
          trailing: Switch(value: false, onChanged: (value) {}),
        ),
        TSettingsTile(
          icon: TUiConstants.iconImage,
          title: 'HD Image Quality',
          subtitle: 'Set image quality to high definition',
          trailing: Switch(value: false, onChanged: (value) {}),
        ),
      ],
    );
  }
}
