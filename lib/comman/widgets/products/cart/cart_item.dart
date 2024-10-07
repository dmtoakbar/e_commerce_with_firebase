import 'package:flutter/material.dart';

import '../../../texts/product_title_text.dart';
import '../../images/t_rounded_image.dart';
import '../texts/t_brand_title_text_with_verified_Icon.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class TCatItem extends StatelessWidget {
  const TCatItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // image
        TRoundedImage(imageUrl: TImages.productImage3,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkerGrey
              : TColors.light,

        ),
        const SizedBox(width: TSizes.spaceBtwItems,),

        // title, price, & size

        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TBrandTitleWithVerificationIcon(title: 'Nike', ),
            const Flexible(child: TProductTitleText(title: 'Black Sports shoes', maxLines: 1,)),
            // Attribute
            Text.rich(
                TextSpan(
                    children:[
                      TextSpan(
                          text: 'Color ', style: Theme.of(context).textTheme.bodySmall
                      ),
                      TextSpan(
                          text: 'Green ', style: Theme.of(context).textTheme.bodyLarge
                      ),
                      TextSpan(
                          text: 'Size ', style: Theme.of(context).textTheme.bodySmall
                      ),
                      TextSpan(
                          text: 'UK 34 ', style: Theme.of(context).textTheme.bodyLarge
                      )
                    ]
                )
            )
          ],
        )
      ],
    );
  }
}