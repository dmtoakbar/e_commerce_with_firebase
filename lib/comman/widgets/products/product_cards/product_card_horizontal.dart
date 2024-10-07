import 'package:e_commerce_project/comman/texts/product_title_text.dart';
import 'package:e_commerce_project/comman/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_project/comman/widgets/images/t_rounded_image.dart';
import 'package:e_commerce_project/comman/widgets/products/texts/t_brand_title_text_with_verified_Icon.dart';
import 'package:e_commerce_project/comman/widgets/products/texts/t_product_price_text.dart';
import 'package:e_commerce_project/utils/constants/image_strings.dart';
import 'package:e_commerce_project/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../icons/t_circular_icon.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
        width: 310,
        padding: const EdgeInsets.all(1),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(TSizes.productImageRadius),
    color: dark ? TColors.darkerGrey : TColors.lightContainer),
    child: Row(
      children: [
        // thumnail
        TRoundedContainer(
          height: 120,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: dark ? TColors.dark : TColors.light,
          child: Stack(
            children: [
              // thumnail image
              const SizedBox(
                width: 120,
                height: 120,
                child: TRoundedImage(
                  imageUrl: TImages.productImage3,
                  applyImageRadius: true,
                ),
              ),
             // sale tag
              Positioned(
                top: 12,
                child: TRoundedContainer(
                  radius: TSizes.sm,
                  backgroundColor: TColors.secondary.withOpacity(0.8),
                  padding: const EdgeInsets.symmetric(
                      horizontal: TSizes.sm, vertical: TSizes.xs),
                  child: Text(
                    '25%',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(color: TColors.black),
                  ),
                ),
              ),
              // favourite icon button
              const Positioned(
                top: 0,
                right: 0,
                child: TCircularIcon(
                  icon: Iconsax.heart5,
                  color: Colors.red,
                ),
              )
            ],
          ),
        ),

        // detail
        SizedBox(
          width: 172,
          child: Padding(
            padding: const EdgeInsets.only(
                top: TSizes.sm,
                left: TSizes.sm
            ),
            child: Column(
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TProductTitleText(
                        title: 'Green Nike halif sleeves shirt', smallSize: true,
                    ),
                    SizedBox(height: TSizes.spaceBtwItems/2,),
                    TBrandTitleWithVerificationIcon(
                        title: 'Nike'
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Flexible(child: TProductPriceText(price: '230 ')),
                    // add to cart
                    Container(
                      decoration: const BoxDecoration(
                          color: TColors.dark,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(TSizes.cardRadiusMd),
                              bottomRight:
                              Radius.circular(TSizes.productImageRadius))),
                      child: const SizedBox(
                          width: TSizes.iconLg * 1.2,
                          height: TSizes.iconLg * 1.2,
                          child: Center(
                              child: Icon(
                                Iconsax.add,
                                color: TColors.white,
                              ))),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    ),
    );
  }
}
