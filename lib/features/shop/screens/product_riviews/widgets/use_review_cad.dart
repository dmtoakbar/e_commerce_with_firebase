import 'package:e_commerce_project/comman/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_project/features/shop/screens/product_riviews/widgets/t_rating_bar_indicator.dart';
import 'package:e_commerce_project/utils/constants/colors.dart';
import 'package:e_commerce_project/utils/constants/image_strings.dart';
import 'package:e_commerce_project/utils/constants/sizes.dart';
import 'package:e_commerce_project/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
            children: [
              const CircleAvatar(backgroundImage: AssetImage(TImages.userProfileImage1),),
              const SizedBox(width: TSizes.spaceBtwItems,),
              Text('John Doe', style: Theme.of(context).textTheme.titleLarge,)
            ],
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert))
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems,),
        
        // review
        Row(
          children: [
            const TRatingBarIndicator(rating: 4),
            const SizedBox(width: TSizes.spaceBtwItems,),
            Text('01 Nov , 2023', style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems,),
        const ReadMoreText(
          'One of the most effective ways to check if a profile picture is fake is by conducting a reverse image search. This can be done using search engines like Google Image Search or',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: ' Show less',
          trimCollapsedText: ' Show more',
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
        ),
        const SizedBox(height: TSizes.spaceBtwItems,),

        // company reviews
        TRoundedContainer(
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('T-store', style: Theme.of(context).textTheme.titleMedium,),
                    Text('02 Nov , 2023', style: Theme.of(context).textTheme.bodyMedium,),
                  ],
                ),
                const SizedBox( height: TSizes.spaceBtwItems,),
                const ReadMoreText(
                  'One of the most effective ways to check if a profile picture is fake is by conducting a reverse image search. This can be done using search engines like Google Image Search or',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: ' Show less',
                  trimCollapsedText: ' Show more',
                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
                  lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections,)
      ],
    );
  }
}
