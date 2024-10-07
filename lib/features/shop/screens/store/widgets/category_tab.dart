import 'package:e_commerce_project/comman/texts/section_heading.dart';
import 'package:e_commerce_project/comman/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_project/comman/widgets/products/product_cards/product_cart_vertical.dart';
import 'package:flutter/material.dart';

import '../../../../../comman/widgets/brands/brand_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // brands
              const TBrandShowCase(images: [TImages.productImage1, TImages.productImage2, TImages.productImage3, ],),
              const TBrandShowCase(images: [TImages.productImage1, TImages.productImage2, TImages.productImage3, ],),
              // product
              TSectionHeading(title: "You might like", showActionButton: true, onPressed: () {},),
              const SizedBox(height: TSizes.spaceBtwItems,),
              TGridLayout(itemCount: 4, itemBuilder: (_, index) {
                return const TProductCardVertical();
              }),
              const SizedBox(height: TSizes.spaceBtwSections,)
            ],
          ),
        ),
      ],
    );
  }
}
