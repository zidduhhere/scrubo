import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/colors.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/widgets/grids/custom_grid.dart';
import 'package:scrubo/utils/widgets/headings/custom_row_header.dart';

class TVehicleSelection extends StatelessWidget {
  const TVehicleSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomRowHeader(leadingText: 'Select Vehicle', isTrailing: false),
        // const SizedBox(height: TUiConstants.defaultSpacing),
        const SizedBox(height: TUiConstants.defaultSpacing),
        TGridView(
            mainAxisSpacing: TUiConstants.spaceBtwTexts,
            crossAxisCount: 3,
            crossAxisSpacing: TUiConstants.spaceBtwTexts,
            itemBuilder: (context, index) {
              return ChoiceChip(
                side: BorderSide.none,
                label: SizedBox(
                    width: 80,
                    child: Text(
                      'Honda swift $index',
                      overflow: TextOverflow.ellipsis,
                    )),
                selected: index == 2,
                checkmarkColor: Colors.white,
                color: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.selected)) {
                    return TColors.lightPrimaryColor;
                  }
                  return TColors.lightInverseSurface;
                }),
                shape: const RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(TUiConstants.borderRadiusMax),
                  ),
                ),
                onSelected: (bool selected) {},
                backgroundColor: TColors.lightSurfaceContainerHigh,
                selectedColor: TColors.lightPrimaryColor,
              );
            },
            itemCount: 4),
        const SizedBox(height: TUiConstants.defaultSpacing),
        const Placeholder(
          fallbackHeight: 300,
          child: Center(
            child: Text('Service Addons, different types'),
          ),
        ),
        const SizedBox(height: TUiConstants.defaultSpacing),
      ],
    );
  }
}



// return ChoiceChip(
//                 side: BorderSide.none,
//                 label: SizedBox(
//                     width: 80,
//                     child: Text(
//                       'Honda swift $index',
//                       overflow: TextOverflow.ellipsis,
//                     )),
//                 selected: index == 2,
//                 checkmarkColor: Colors.white,
//                 color: WidgetStateProperty.resolveWith((states) {
//                   if (states.contains(WidgetState.selected)) {
//                     return TColors.lightPrimaryColor;
//                   }
//                   return TColors.lightInverseSurface;
//                 }),
//                 shape: const RoundedRectangleBorder(
//                   side: BorderSide.none,
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(TUiConstants.borderRadiusMax),
//                   ),
//                 ),
//                 onSelected: (bool selected) {},
//                 backgroundColor: TColors.lightSurfaceContainerHigh,
//                 selectedColor: TColors.lightPrimaryColor,
//               );