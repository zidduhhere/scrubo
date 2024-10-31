import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:scrubo/utils/constants/constants.dart';
import 'package:scrubo/utils/constants/image_strings.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/helpers/helper_functions.dart';

class ProfileManagementView extends StatelessWidget {
  const ProfileManagementView({super.key});

  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          actions: const [
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: TUiConstants.paddingSmall),
              child: Icon(Iconsax.edit),
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
                        Iconsax.ticket,
                        color: Theme.of(context).colorScheme.onPrimaryFixed,
                      ),
                    ),
                    SmallProfileContainer(
                      text: '2',
                      leading: Icon(
                        Iconsax.car,
                        color: Theme.of(context).colorScheme.onPrimaryFixed,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: TUiConstants.defaultSpacing),
                const Divider(
                  indent: 60,
                  endIndent: 60,
                  height: 1,
                ),
                const SizedBox(height: TUiConstants.spaceBtwSections * 2),
              ],
            ),
          ),
        ));
  }
}

class SmallProfileContainer extends StatelessWidget {
  const SmallProfileContainer(
      {super.key, this.leading, required this.text, this.trailing})
      : assert(leading == null || trailing == null,
            'Either leading or trailing can be provided');
  final Widget? leading, trailing;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: TUiConstants.smallContainerHeight,
      width: TUiConstants.smallContainerWidth,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryFixed,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          leading ?? const SizedBox(),
          const SizedBox(width: TUiConstants.paddingSmall),
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: Theme.of(context).colorScheme.onPrimaryFixed),
          ),
          const SizedBox(width: TUiConstants.paddingSmall),
          trailing ?? const SizedBox(),
        ],
      ),
    );
  }
}
