import 'package:flutter/material.dart';

import '../../../../../comman/texts/section_heading.dart';
import '../../../../../utils/constants/sizes.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(title: 'Shipping Address', buttonTitle: "Change", showActionButton: true, onPressed: () {},),
        const SizedBox(height: TSizes.spaceBtwItems / 2,),
        Text('Coding with T', style: Theme.of(context).textTheme.bodyLarge,),
        const SizedBox(width: TSizes.spaceBtwItems /2,),
        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16,),
            const SizedBox(width: TSizes.spaceBtwItems,),
            Text('79837493', style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        const SizedBox(width: TSizes.spaceBtwItems /2,),
        Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey, size: 16,),
            const SizedBox(width: TSizes.spaceBtwItems,),
            Text('south lines, maine 8098, USA', style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
      ],
    );
  }
}
