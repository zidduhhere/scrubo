import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:scrubo/pages/home/view/widgets/product_card_view.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

class ProductViewGrid extends StatelessWidget {
  const ProductViewGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: THelperFunctions.getDeviceHeight(context) * 0.8,
      child: GridView.builder(
        dragStartBehavior: DragStartBehavior.down,
        itemCount: 5,
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(0, TUiConstants.s, 0, 0),
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: .8,
            mainAxisSpacing: TUiConstants.m,
            crossAxisCount: 2),
        itemBuilder: (context, index) {
          return const ProductViewCard();
        },
      ),
    );
  }
}
