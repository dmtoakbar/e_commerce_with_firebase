import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../images/t_circular_images.dart';
import '../texts/t_brand_title_text_with_verified_Icon.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key, required this.showBorder, this.onTap,
  });

  final bool showBorder;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: TRoundedContainer(
        padding: const EdgeInsets.all(TSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Center(
          child: Row(
            children: [
              // icon
              Flexible(
                child: TCircularImages(
                  isNetworkImage: false,
                  image: TImages.clothIcon,
                  backgroundColor: Colors.transparent,
                  overlayColor:
                  THelperFunctions.isDarkMode(context)
                      ? TColors.white
                      : TColors.black,
                ),
              ),
              const SizedBox(
                width: TSizes.spaceBtwItems / 2,
              ),
              // Text
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    const TBrandTitleWithVerificationIcon(
                      title: 'Nike',
                      brandTextSize: TextSizes.large,
                    ),
                    Text(
                      '256 products with new world',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}