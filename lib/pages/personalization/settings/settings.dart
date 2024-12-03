import 'package:flutter/material.dart';
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

class TSettingsTile extends StatelessWidget {
  const TSettingsTile(
      {super.key,
      required this.title,
      required this.subtitle,
      this.trailing,
      required this.icon,
      this.onTap});

  final String title;
  final String subtitle;
  final Widget? trailing;
  final Function()? onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).primaryColor,
        size: TUiConstants.iconSizeLarge,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: Theme.of(context).colorScheme.secondary,
            ),
      ),
      trailing: trailing,
    );
  }
}

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
          onPressed: () {},
          icon: const Icon(
            TUiConstants.iconEdit,
            color: TColors.lightOnPrimary,
          )),
    );
  }
}

class TCircualrImage extends StatelessWidget {
  const TCircualrImage({
    super.key,
    this.width,
    this.height,
    this.padding,
    required this.imageUrl,
  });

  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 50,
      height: height ?? 50,
      padding: padding ?? const EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TUiConstants.borderRadiusMax),
        color: Theme.of(context).colorScheme.secondary,
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
