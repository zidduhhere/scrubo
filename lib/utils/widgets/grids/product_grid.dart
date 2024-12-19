import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrubo/pages/products/controllers/products_controller.dart';
import 'package:scrubo/pages/products/model/product_model.dart';
import 'package:scrubo/pages/products/view/product_detail_view.dart';
import 'package:scrubo/utils/widgets/cards/product_card_view.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/widgets/grids/vertical_product_shimmer.dart';

class ProductViewGrid extends StatelessWidget {
  const ProductViewGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final productsController = ProductsController.instance;
    return SizedBox(
      child: Obx(
        () {
          if (productsController.isLoading.value) {
            return const TVerticalProductShimmer();
          }

          if (productsController.featuredProducts.isEmpty) {
            return const Center(
              child: Text('No products found'),
            );
          }

          return GridView.builder(
            dragStartBehavior: DragStartBehavior.down,
            itemCount: productsController.featuredProducts.length,
            shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(0, TUiConstants.s, 0, 0),
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: TUiConstants.gridViewMainAxisSpacing / 1,
              crossAxisSpacing: TUiConstants.gridViewCrossAxisSpacing / 10,
              crossAxisCount: 2,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (_, index) {
              ProductModel product = productsController.featuredProducts[index];
              int price = product.varitaions[0].price;
              String title = product.name;
              String imageUrl = product.thumbnail;

              String shopAddress = product.shopName;
              int discount = 10;
              String previousPrice =
                  ProductModel.getPreviousPrice(price.toDouble()).toString();

              return GestureDetector(
                  onTap: () {
                    debugPrint(product.toString());
                    Get.to(() => ServiceDetailsView(product: product));
                  },
                  child: ProductViewCard(
                    price: price,
                    previousPrice: previousPrice,
                    title: title,
                    imageUrl: imageUrl,
                    isNetworkImage: true,
                    shopAddress: shopAddress,
                    discount: discount,
                  ));
            },
          );
        },
      ),
    );
  }
}
