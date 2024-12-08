import 'package:flutter/material.dart';
import 'package:scrubo/pages/personalization/widgets/profile_details_card.dart';
import 'package:scrubo/utils/constants/colors.dart';
import 'package:scrubo/utils/constants/constants.dart';
import 'package:scrubo/utils/constants/image_strings.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/widgets/containers/circukar_image_container.dart';
import 'package:scrubo/utils/widgets/custom/custom_divider.dart';
import 'package:scrubo/utils/widgets/headings/custom_row_header.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: const Text('Profile'),
        centerTitle: false,
      ),
      body: Padding(
        padding: TSpacingStyles.paddingWithAppBar,
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: TUiConstants.defaultSpacing),
                const TCircualrImage(
                  imageUrl: TImages.avatar,
                  width: 70,
                  height: 70,
                ),
                const SizedBox(height: TUiConstants.defaultSpacing),
                const Text('Change Profile Picture'),
                const SizedBox(height: TUiConstants.spaceBtwSections),
                const CustomDivider(),
                const SizedBox(height: TUiConstants.spaceBtwSections),
                const CustomRowHeader(
                  leadingText: 'Profile Information',
                  isTrailing: false,
                ),
                const SizedBox(height: TUiConstants.defaultSpacing),
                ProfileDetailsContainer(
                  property: 'Name',
                  value: 'Ubaid Atlhaf',
                  onPressed: () {},
                ),
                ProfileDetailsContainer(
                  property: TTextConstants.username,
                  value: 'ubaidatlhaf',
                  onPressed: () {},
                ),
                const SizedBox(height: TUiConstants.spaceBtwSections),
                const CustomDivider(),
                const SizedBox(height: TUiConstants.spaceBtwSections),
                const CustomRowHeader(
                    leadingText: 'Personal Information', isTrailing: false),
                const SizedBox(height: TUiConstants.defaultSpacing),
                ProfileDetailsContainer(
                  onPressed: () {},
                  property: 'User ID',
                  value: '45689',
                  trailingIcon: TUiConstants.iconCopy,
                ),
                ProfileDetailsContainer(
                    onPressed: () {},
                    property: 'E-mail',
                    value: 'ubaidalthaf@gmail.com'),
                ProfileDetailsContainer(
                    onPressed: () {},
                    property: 'Phone Number',
                    value: '+91 1234567890'),
                ProfileDetailsContainer(
                  property: 'Gender',
                  value: 'Male',
                  onPressed: () {},
                ),
                ProfileDetailsContainer(
                  property: 'Date Of Birth',
                  value: '10 Oct 2003',
                  onPressed: () {},
                ),
                const CustomDivider(),
                const SizedBox(height: TUiConstants.spaceBtwSections),
                Center(
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Close Account',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(color: TColors.lightError),
                      )),
                ),
                const SizedBox(height: TUiConstants.spaceBtwSections),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
