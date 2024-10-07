import 'package:e_commerce_project/comman/widgets/loaders/shimmer.dart';
import 'package:e_commerce_project/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TCategoryShimmer extends StatelessWidget {
  const TCategoryShimmer({super.key, this.itemCount = 8});

  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (_, __) => const SizedBox(width: TSizes.spaceBtwItems,),
          itemCount: itemCount,
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // image
              TShimmerEffect(width: 55, height: 55, radius: 55,),
              SizedBox(height: TSizes.spaceBtwItems/2,),

              // text
              TShimmerEffect(width: 55, height: 8)
            ],
          );
        },
      ),
    );
  }
}
