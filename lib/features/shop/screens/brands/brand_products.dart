import 'package:e_commerce_project/comman/widgets/appbar/appbar.dart';
import 'package:e_commerce_project/comman/widgets/products/product_cards/brand_card.dart';
import 'package:e_commerce_project/comman/widgets/products/sortable/sortable_products.dart';
import 'package:e_commerce_project/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(
        title: Text('Nike'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // brand detail
              TBrandCard(showBorder: true),
              SizedBox(height: TSizes.spaceBtwSections,),
              
              TSortableProducts()
            ],
          ),
        ),
      ),
    );
  }
}
