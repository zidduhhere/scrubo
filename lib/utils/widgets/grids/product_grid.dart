import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrubo/utils/widgets/cards/product_card_view.dart';
import 'package:scrubo/pages/home/viewmodel/home_view_controller.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

class ProductViewGrid extends StatelessWidget {
  const ProductViewGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeViewController controller = Get.find<HomeViewController>();
    return SizedBox(
      child: GridView.builder(
        dragStartBehavior: DragStartBehavior.down,
        itemCount: 4,
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(0, TUiConstants.s, 0, 0),
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: TUiConstants.gridViewMainAxisSpacing / 1,
          crossAxisSpacing: TUiConstants.gridViewCrossAxisSpacing / 10,
          crossAxisCount: 2,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (_, index) {
          int price = controller.productGridItems[index]!["price"]!;

          String title = controller.productGridItems[index]!["title"]!;
          String imageUrl = controller.productGridItems[index]!["imageUrl"]!;

          String shopAddress =
              controller.productGridItems[index]!["shopAddress"]!;
          int discount = controller.productGridItems[index]!["discount"]!;
          String previousPrice =
              controller.prevoisPrice(price, discount).toString();
          return GestureDetector(
              onTap: () {
                Get.toNamed('/serviceDetails');
              },
              child: ProductViewCard(
                price: price,
                previousPrice: previousPrice,
                title: title,
                imageUrl: imageUrl,
                isNetworkImage: false,
                shopAddress: shopAddress,
                discount: discount,
              ));
        },
      ),
    );
  }
}
