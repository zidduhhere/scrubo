import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrubo/pages/profile_management/view/widgets/cusotm_divider.dart';
import 'package:scrubo/pages/profile_management/view/widgets/profile_selection_container.dart';
import 'package:scrubo/pages/profile_management/view/widgets/small_profile_container.dart';
import 'package:scrubo/pages/profile_management/viewmodel/profile_controller.dart';
import 'package:scrubo/utils/constants/constants.dart';
import 'package:scrubo/utils/constants/image_strings.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

class ProfileManagementView extends StatelessWidget {
  const ProfileManagementView({super.key});
  @override
  Widget build(context) {
    ProfileViewController profileViewController =
        Get.put(ProfileViewController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          actions: const [
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: TUiConstants.paddingSmall),
              child: Icon(TUiConstants.iconEdit),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: TUiConstants.paddingSmall),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: TUiConstants.spaceBtwSections),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: TUiConstants.paddingLarge),
                  width: double.maxFinite,
                  height: 150,
                  decoration: BoxDecoration(
                    boxShadow: [
                      TShadowStyles.verticalShadow,
                      TShadowStyles.horizontalShadow
                    ],
                    borderRadius: BorderRadius.circular(999),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        child: ClipOval(
                          child: Image.asset(
                            TImages.avatar,
                            fit: BoxFit.cover,
                            width: 100,
                          ),
                        ),
                      ),
                      const SizedBox(width: TUiConstants.defaultSpacing),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'John Doe',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary),
                          ),
                          const SizedBox(height: TUiConstants.paddingSmall),
                          Text(
                            TTextConstants.appAuthorEmail,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary),
                          ),
                          const SizedBox(height: TUiConstants.paddingSmall),
                          Text(
                            TTextConstants.tempPhoneNumber,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: TUiConstants.defaultSpacing),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SmallProfileContainer(
                      text: '8',
                      leading: Icon(
                        TUiConstants.iconPrevious,
                        color: Theme.of(context).colorScheme.onPrimaryFixed,
                      ),
                    ),
                    SmallProfileContainer(
                      text: '2',
                      leading: Icon(
                        TUiConstants.iconCar,
                        color: Theme.of(context).colorScheme.onPrimaryFixed,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: TUiConstants.spaceBtwSections),
                const CustomDivider(),
                ...List.generate(profileViewController.profileSections.length,
                    (int index) {
                  return InkWell(
                    borderRadius:
                        BorderRadius.circular(TUiConstants.borderRadiusLarge),
                    splashColor: Theme.of(context).colorScheme.primaryContainer,
                    onTap: () {
                      switch (index) {
                        case 0:
                          profileViewController.address();
                          break;
                        case 1:
                          profileViewController.payments();
                          break;
                        case 2:
                          profileViewController.feedback();
                          break;
                        case 3:
                          profileViewController.termsAndConditions();
                          break;
                        case 4:
                          profileViewController.logout();
                          break;
                      }
                    },
                    child: ProfileSectionContainer(
                      iconColor: profileViewController
                          .profileSections[index]!["iconColor"],
                      text:
                          profileViewController.profileSections[index]!["text"],
                      iconData: profileViewController
                          .profileSections[index]!["iconData"],
                    ),
                  );
                })
              ],
            ),
          ),
        ));
  }
}
