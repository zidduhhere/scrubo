import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrubo/data/user/user_controller.dart';
import 'package:scrubo/pages/personalization/widgets/profile_details_card.dart';
import 'package:scrubo/utils/constants/colors.dart';
import 'package:scrubo/utils/constants/constants.dart';
import 'package:scrubo/utils/constants/image_strings.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/formatter/phone_number_formatter.dart';
import 'package:scrubo/utils/widgets/containers/circukar_image_container.dart';
import 'package:scrubo/utils/widgets/custom/custom_divider.dart';
import 'package:scrubo/utils/widgets/headings/custom_row_header.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
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
                Obx(
                  () => ProfileDetailsContainer(
                    property: 'Name',
                    value: controller.user.value?.fullName ?? 'Unknown',
                    onPressed: () {},
                  ),
                ),
                Obx(
                  () => ProfileDetailsContainer(
                    property: TTextConstants.username,
                    value: controller.user.value?.username ?? 'Unknown',
                    onPressed: () {},
                  ),
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
                  value: controller.user.value?.uid ?? 'Unknown',
                  trailingIcon: TUiConstants.iconCopy,
                ),
                ProfileDetailsContainer(
                    onPressed: () {},
                    property: 'E-mail',
                    value: controller.user.value?.email ?? 'Unknown'),
                ProfileDetailsContainer(
                    onPressed: () {},
                    property: 'Phone Number',
                    value: TPhoneNumberFormatter.addCountryCode(
                        controller.user.value?.phoneNumber ?? '')),
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
