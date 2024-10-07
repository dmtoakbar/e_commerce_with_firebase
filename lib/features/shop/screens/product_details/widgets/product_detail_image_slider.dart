import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../comman/widgets/appbar/appbar.dart';
import '../../../../../comman/widgets/custom_shapes/curved_edges/curved_edge_widget.dart';
import '../../../../../comman/widgets/icons/t_circular_icon.dart';
import '../../../../../comman/widgets/images/t_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TCurvedEdgeWidget(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            // main image large
            const SizedBox(
                height: 400,
                child: Padding(
                  padding:
                  EdgeInsets.all(TSizes.productImageRadius),
                  child: Center(
                      child: Image(
                          image: AssetImage(TImages.productImage3))),
                )),
            // product image slider
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                    itemCount: 4,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    separatorBuilder: (_, __) => const SizedBox(
                      width: TSizes.spaceBtwItems,
                    ),
                    itemBuilder: (_, index) => TRoundedImage(
                        width: 80,
                        fit: BoxFit.contain,
                        backgroundColor:
                        dark ? TColors.dark : TColors.white,
                        border: Border.all(color: TColors.primary),
                        padding: const EdgeInsets.all(TSizes.sm),
                        imageUrl: TImages.productImage3)),
              ),
            ),
            // app bar
            const TAppBar(
              showBackArrow: true,
              actions: [
                TCircularIcon(icon: Iconsax.heart5, color: Colors.red,)
              ],
            )
          ],
        ),
      ),
    );
  }
}