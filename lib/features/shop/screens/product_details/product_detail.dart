import 'package:e_commerce_project/comman/texts/section_heading.dart';
import 'package:e_commerce_project/features/shop/screens/product_details/widgets/bottom_add_to_card_widget.dart';
import 'package:e_commerce_project/features/shop/screens/product_details/widgets/product_attribute.dart';
import 'package:e_commerce_project/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:e_commerce_project/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:e_commerce_project/features/shop/screens/product_details/widgets/rating_share-widget.dart';
import 'package:e_commerce_project/features/shop/screens/product_riviews/product_riviews.dart';
import 'package:e_commerce_project/utils/constants/colors.dart';
import 'package:e_commerce_project/utils/constants/sizes.dart';
import 'package:e_commerce_project/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // product main image
            const TProductImageSlider(),

            // product detail
            Padding(
                padding: const EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace,
                ),
              child: Column(
                children: [
                  // rating and share
                  const TRatingAndShare(),
                  // price , title, stock & brand
                  const TProductMetaData(),
                  
                  // attributes
                  const TProductAttributes(),
                  const SizedBox(height: TSizes.spaceBtwSections,),
                  
                  // checkout button
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: const Text('Checkout'))),
                  const SizedBox(height: TSizes.spaceBtwSections,),
                  // description
                  const TSectionHeading(title: 'Description', showActionButton: false,),
                  const SizedBox(height: TSizes.spaceBtwItems,),
                  const ReadMoreText(
                    'A Flutter plugin that allows for expanding and collapsing text with the added capability to style and interact with specific patterns in the text like hashtags, URLs, and mentions using the new Annotation feature.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  
                  // reviews
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(title: 'Reviews(199)', showActionButton: false,),
                      IconButton(onPressed: () => Get.to(() => const ProductReviewsScreen()), icon: const Icon(Iconsax.arrow_right_3, size: 18, color: TColors.darkerGrey,))
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections,),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}




