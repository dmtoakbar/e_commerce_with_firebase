import 'package:e_commerce_project/comman/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_project/comman/widgets/products/product_cards/product_cart_vertical.dart';
import 'package:e_commerce_project/features/shop/screens/all_products/all_products.dart';
import 'package:e_commerce_project/features/shop/screens/home/wigets/home_appbar.dart';
import 'package:e_commerce_project/features/shop/screens/home/wigets/home_categories.dart';
import 'package:e_commerce_project/features/shop/screens/home/wigets/promo_slider.dart';
import 'package:e_commerce_project/utils/constants/colors.dart';
import 'package:e_commerce_project/utils/constants/image_strings.dart';
import 'package:e_commerce_project/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../comman/texts/section_heading.dart';
import '../../../../comman/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../comman/widgets/custom_shapes/containers/search_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // header
            TPrimaryHeaderContainer(
                child: Column(
              children: [
                // appbar
                const THomeAppBar(),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                // search bar
                TSearchContainer(
                  text: 'Search in Store',
                  onTap: () {},
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                // categories
                const Padding(
                  padding: EdgeInsets.only(left: TSizes.defaultSpace),
                  child: Column(
                    children: [
                      TSectionHeading(
                        title: 'Popular Categories',
                        showActionButton: false,
                        textColor: TColors.white,
                      ),
                      SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      THomeCategories(),
                    ],
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwSections,)
              ],
            )),
            // body
              Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TPromoSlider(
                    banners: [
                     TImages.promoBanner1,
                      TImages.promoBanner2,
                      TImages.promoBanner3,
                      TImages.promoBanner1,
                      TImages.promoBanner2,
                      TImages.promoBanner3
                    ],
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  // popular products
                   TSectionHeading(
                      title: 'Popular Products',
                     onPressed: () {
                        Get.to(() => const AllProducts());
                     },
                  ),
                 TGridLayout(itemCount: 4, itemBuilder: (_, index) => const TProductCardVertical())
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}




