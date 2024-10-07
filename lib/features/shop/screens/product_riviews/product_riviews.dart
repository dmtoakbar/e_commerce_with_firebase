import 'package:e_commerce_project/comman/widgets/appbar/appbar.dart';
import 'package:e_commerce_project/features/shop/screens/product_riviews/widgets/overall_product_rating.dart';
import 'package:e_commerce_project/features/shop/screens/product_riviews/widgets/t_rating_bar_indicator.dart';
import 'package:e_commerce_project/features/shop/screens/product_riviews/widgets/use_review_cad.dart';
import 'package:e_commerce_project/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // app bar
      appBar: const TAppBar(
        title: Text('Reviews & Ratings'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
       padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Ratings and Reviews are verified and are from people who use the same type of device that you use"),
            const SizedBox(height: TSizes.spaceBtwItems,),

            // overall product rating
            const TOverallProductRating(),
            
            const TRatingBarIndicator(rating: 3.5,),
            Text('12, 611', style: Theme.of(context).textTheme.bodySmall,),
            const SizedBox(height: TSizes.spaceBtwSections,),


            // user Review List
            const UserReviewCard(),
            const UserReviewCard(),
            const UserReviewCard(),
            const UserReviewCard(),
          ],
        ),
      ),
    );
  }
}






