import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrubo/pages/home/view/widgets/product_card_view.dart';
import 'package:scrubo/utils/constants/image_strings.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

class ProductViewGrid extends StatelessWidget {
  const ProductViewGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView.builder(
        dragStartBehavior: DragStartBehavior.down,
        itemCount: 4,
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(0, TUiConstants.s, 0, 0),
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: .8,
          mainAxisSpacing: TUiConstants.gridViewMainAxisSpacing / 2,
          crossAxisSpacing: TUiConstants.gridViewCrossAxisSpacing / 2,
          crossAxisCount: 2,
        ),
        itemBuilder: (_, index) {
          return GestureDetector(
              onTap: () {
                Get.toNamed('/serviceDetails');
              },
              child: const ProductViewCard(
                price: "200 ₹",
                previousPrice: "220 ₹",
                title: "Car Wash",
                imageUrl: TImages.carTransperent,
                isNetworkImage: false,
                shopAddress: "Shop 1, 2nd Floor, 3rd Building",
                discount: "10% ",
              ));
        },
      ),
    );
  }
}
