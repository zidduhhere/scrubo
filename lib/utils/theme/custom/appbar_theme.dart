import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/colors.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

class TAppBarTheme {
  TAppBarTheme._();
  static AppBarTheme lightAppbarTheme = const AppBarTheme(
    centerTitle: true,
    actionsIconTheme: IconThemeData(color: TColors.lightOutline),
    // titleTextStyle: TTextTheme.lightTextTheme.headlineSmall,
    backgroundColor: TColors.lightSurface,
    elevation: 0,
    toolbarHeight: TUiConstants.appBarheight,
    titleSpacing: 1.0,
  );

  static AppBarTheme darkAppbarTheme = const AppBarTheme(
    centerTitle: true,
    actionsIconTheme: IconThemeData(color: TColors.darkOutline),
    backgroundColor: TColors.darkSurface,
    elevation: 0,
    toolbarHeight: TUiConstants.appBarheight,
    titleSpacing: 1.0,
  );
}


// child: AppBar(
//           title: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Good day for you car",
//                 style: Theme.of(context).textTheme.labelSmall!.copyWith(
//                       color: Theme.of(context).colorScheme.secondary,
//                     ),
//               ),
//               Text(
//                 "Ubaid Altaf",
//                 style: Theme.of(context).textTheme.headlineSmall!.copyWith(
//                       color: Theme.of(context).colorScheme.onSurface,
//                     ),
//                 textAlign: TextAlign.start,
//               ),
//             ],
//           ),
//           centerTitle: false,
//           backgroundColor: Colors.transparent,
//           scrolledUnderElevation: 0,
//           bottomOpacity: 0,
//           toolbarHeight: 80,
//           actions: [
//             badges.Badge(
//               badgeStyle: badges.BadgeStyle(
//                   borderRadius:
//                       BorderRadius.circular(TUiConstants.borderRadiusSmall),
//                   shape: badges.BadgeShape.circle,
//                   badgeColor: Theme.of(context).colorScheme.errorContainer),
//               position: badges.BadgePosition.topEnd(top: 0, end: 3),
//               badgeContent: Obx(() => Text(
//                     homeviewController.badgeNumber.value.toString(),
//                     style: Theme.of(context).textTheme.labelSmall!.copyWith(
//                           color: Theme.of(context).colorScheme.onErrorContainer,
//                         ),
//                   )),
//               child: IconButton(
//                 onPressed: () {
//                   homeviewController.badgeNumber.value++;
//                 },
//                 icon: const Icon(Iconsax.notification),
//               ),
//             ),
//             const SizedBox(width: TUiConstants.s / 2),
//             CircleAvatar(
//               radius: TUiConstants.borderRadiusCircleAvatar,
//               backgroundColor: Theme.of(context).colorScheme.primaryFixed,
//               child: const Icon(Iconsax.user),
//             ),
//             const SizedBox(width: TUiConstants.s),
//           ],
//         ),













//  Column(
//             children: [
//               const AddressSelectionHeader(),
//               const SizedBox(height: TUiConstants.spaceBtwSections),
//               //Offers Section
//               const CustomHomeCarousel(),
//               const SizedBox(height: TUiConstants.spaceBtwSections),
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: TUiConstants.s,
//                 ),
//                 //ALL CATEGORIES
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       TTextConstants.allCategories.toUpperCase(),
//                       style:
//                           Theme.of(context).textTheme.displayMedium!.copyWith(
//                                 fontSize: TUiConstants.fontSizeMedium,
//                                 color: Theme.of(context).colorScheme.onSurface,
//                               ),
//                     ),
//                     Text(
//                       TTextConstants.seeAll,
//                       style:
//                           Theme.of(context).textTheme.displayMedium!.copyWith(
//                                 fontSize: TUiConstants.fontSizeMedium,
//                                 fontWeight: FontWeight.w600,
//                                 color: Theme.of(context).colorScheme.onSurface,
//                               ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: TUiConstants.defaultSpacing),
//               const CategoriesList(),
//               const SizedBox(height: TUiConstants.spaceBtwSections),
//               SizedBox(
//                 height: THelperFunctions.getDeviceHeight(context) * .8,
//                 child: GridView.builder(
//                     itemCount: homeviewController.serviceDetails.length,
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 2),
//                     itemBuilder: (context, index) {
//                       return Card(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(
//                               TUiConstants.borderRadiusMedium),
//                         ),
//                         elevation: 0,
//                         margin: const EdgeInsets.all(TUiConstants.s),
//                         child: ListTile(
//                           contentPadding: const EdgeInsets.all(TUiConstants.s),
//                           title: Text(
//                             homeviewController.serviceDetails[index]!['title'],
//                             style: Theme.of(context).textTheme.titleMedium,
//                           ),
//                           subtitle: Text(
//                             homeviewController
//                                 .serviceDetails[index]!['subtitle'],
//                             style: Theme.of(context).textTheme.bodySmall,
//                           ),
//                           leading: const CircleAvatar(
//                             backgroundImage: AssetImage(TImages.logo),
//                             radius: 30,
//                           ),
//                           trailing: Icon(
//                             Icons.arrow_forward_ios,
//                             color: Theme.of(context).colorScheme.primary,
//                           ),
//                         ),
//                       );
//                     }),
//               )
//             ],
//           ),
