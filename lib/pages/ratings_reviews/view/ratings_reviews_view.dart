import 'package:flutter/material.dart';
import 'package:scrubo/pages/ratings_reviews/view/overall_product_rating.dart';
import 'package:scrubo/pages/ratings_reviews/widgets/custom_rating_view_indicator.dart';
import 'package:scrubo/pages/ratings_reviews/widgets/user_review_card.dart';

import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/widgets/headings/custom_app_bar.dart';

class ProdcutReviewView extends StatelessWidget {
  const ProdcutReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TCustomSimpleAppbar(
        title: 'Ratings & Reviews',
        leading: TUiConstants.iconBack,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TUiConstants.defaultSpacing),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ratings and reviews are verified and are from people who use the same device that you use",
              ),
              SizedBox(height: TUiConstants.defaultSpacing),
              //Overall Product Rating
              OverallProdcutRating(),
              SizedBox(height: TUiConstants.defaultSpacing),
              TRatingIndicator(
                rating: 2.5,
              ),
              Text('12,611'),
              SizedBox(height: TUiConstants.spaceBtwSections),
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
