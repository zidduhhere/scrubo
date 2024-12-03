import 'package:flutter/material.dart';
import 'package:scrubo/pages/personalization/widgets/changable_profile_tiles_view.dart';
import 'package:scrubo/pages/personalization/widgets/profile_container.dart';
import 'package:scrubo/pages/personalization/widgets/settings_tile.dart';
import 'package:scrubo/utils/constants/colors.dart';
import 'package:scrubo/utils/constants/image_strings.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/widgets/custom/shapes/curved_edge_widget.dart';
import 'package:scrubo/utils/widgets/custom_app_bar.dart';
import 'package:scrubo/utils/widgets/headings/custom_row_header.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TCurvedEdgeWidget(
              height: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //Appbar Section
                  TCustomNormalAppBar(
                    title: 'Account',
                    titlemsg: 'Settings',
                    backgroundColor: Colors.transparent,
                    profileIcon: false,
                    customStyle: true,
                    titleColor: TColors.lightOnPrimary,
                    subtitleColor: TColors.lightOnPrimary,
                  ),
                  SizedBox(height: TUiConstants.defaultSpacing),
                  //Profile Info
                  ProfileInfoContainer(
                    name: 'John Doe',
                    email: 'johndoe@gmail.com',
                    imageUrl: TImages.avatar,
                  ),

                  //Body
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(TUiConstants.defaultSpacing),
              child: Column(
                children: [
                  //Account Settings
                  CustomRowHeader(
                      leadingText: 'Account Settings', isTrailing: false),
                  SizedBox(height: TUiConstants.defaultSpacing),
                  TSettingsTile(
                      icon: TUiConstants.iconHome,
                      title: 'My Addresses',
                      subtitle: 'Set pickup delivery address'),
                  TSettingsTile(
                      icon: TUiConstants.iconService,
                      title: 'My Services',
                      subtitle: 'View your past service details and more'),
                  TSettingsTile(
                      icon: TUiConstants.iconBank,
                      title: 'Bank Account',
                      subtitle: 'Add or remove bank account'),
                  TSettingsTile(
                      icon: TUiConstants.iconDiscount,
                      title: 'My Coupons',
                      subtitle:
                          'View your available coupons and get more referal codes'),
                  TSettingsTile(
                      icon: TUiConstants.iconNotification,
                      title: 'Notifications',
                      subtitle: 'Manage your notifications'),
                  TSettingsTile(
                      icon: TUiConstants.iconPrivacy,
                      title: 'Account Privacy',
                      subtitle: 'Manage data usage and connected accounts'),

                  SizedBox(height: TUiConstants.spaceBtwSections),
                  //App Settings
                  CustomRowHeader(
                      leadingText: 'App Settings', isTrailing: false),
                  SizedBox(height: TUiConstants.defaultSpacing),
                  TSettingsTile(
                      icon: TUiConstants.iconDocumentUpload,
                      title: 'Load Data',
                      subtitle: 'Upload your data to cloud Firebase'),

                  ChangableProfileTiles()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
