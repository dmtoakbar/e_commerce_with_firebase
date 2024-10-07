import 'package:e_commerce_project/comman/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_project/utils/constants/colors.dart';
import 'package:e_commerce_project/utils/constants/sizes.dart';
import 'package:e_commerce_project/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
class TOrderListItems extends StatelessWidget {
  const TOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (_, __) {
        return TRoundedContainer(
          showBorder: true,
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.dark : TColors.light,

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // row 1
              Row(
                children: [
                  // icon

                  const Icon(Iconsax.ship),
                  const SizedBox(width: TSizes.spaceBtwItems/2,),

                  // status and date
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Processing', style: Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.primary, fontWeightDelta: 1),),
                        Text('07, Nov, 2024', style: Theme.of(context).textTheme.headlineSmall,)
                      ],
                    ),
                  ),

                  // icon

                  IconButton(onPressed: (){}, icon: const Icon(Iconsax.arrow_right_34, size: TSizes.iconSm,))
                ],
              ),

              const SizedBox(height: TSizes.spaceBtwItems ),
              // row 2
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        // icon

                        const Icon(Iconsax.tag),
                        const SizedBox(width: TSizes.spaceBtwItems/2,),

                        // status and date
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Order', style: Theme.of(context).textTheme.labelMedium,),
                              Text('[#79879]', style: Theme.of(context).textTheme.titleMedium,)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: Row(
                      children: [
                        // icon

                        const Icon(Iconsax.calendar),
                        const SizedBox(width: TSizes.spaceBtwItems/2,),

                        // status and date
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Shipping Date', style: Theme.of(context).textTheme.labelMedium,),
                              Text('9 nov 2024', style: Theme.of(context).textTheme.titleMedium,)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
      separatorBuilder: (_, __) {
        return const SizedBox(height: TSizes.spaceBtwItems,);
      },
    );
  }
}
