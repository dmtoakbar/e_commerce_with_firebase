import 'package:e_commerce_project/comman/texts/section_heading.dart';
import 'package:e_commerce_project/comman/widgets/appbar/appbar.dart';
import 'package:e_commerce_project/comman/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_project/comman/widgets/products/product_cards/brand_card.dart';
import 'package:e_commerce_project/features/shop/screens/brands/brand_products.dart';
import 'package:e_commerce_project/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Brand'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // heading
              const TSectionHeading(title: 'Brands', showActionButton: false,),
              const SizedBox(height: TSizes.spaceBtwItems, ),

              // brands
              TGridLayout(
                  itemCount: 15,
                  mainAxisExtent: 80,
                  itemBuilder: (context, index) {
                    return TBrandCard(showBorder: true, onTap: () => Get.to(() => const BrandProducts()),);
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}
