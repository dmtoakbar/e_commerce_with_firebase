import 'package:flutter/material.dart';

import '../../../../../comman/widgets/products/cart/add_remove_button.dart';
import '../../../../../comman/widgets/products/cart/cart_item.dart';
import '../../../../../comman/widgets/products/texts/t_product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key, this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 2,
      separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwSections,),
      itemBuilder: (_, index) {
        return Column(
          children: [
            const TCatItem(),
            if(showAddRemoveButtons) const SizedBox(height: TSizes.spaceBtwItems,),
            // add, remove button Row with total price
            if(showAddRemoveButtons)
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width: 70),
                    TProductQuantityWithAddRemoveButton(),
                  ],
                ),
                // add remove item

                TProductPriceText(price: '250')
              ],
            )
          ],
        );
      },
    );
  }
}
