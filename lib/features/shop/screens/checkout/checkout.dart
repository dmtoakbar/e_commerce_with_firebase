import 'package:e_commerce_project/comman/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_project/features/shop/screens/cart/widgets/t_cart_items.dart';
import 'package:e_commerce_project/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:e_commerce_project/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:e_commerce_project/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:e_commerce_project/utils/constants/colors.dart';
import 'package:e_commerce_project/utils/constants/sizes.dart';
import 'package:e_commerce_project/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../comman/widgets/appbar/appbar.dart';
import '../../../../comman/widgets/products/cart/coupon_widget.dart';
import '../../../../comman/widgets/success_screen/success_screen.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constants/image_strings.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Order Reviews',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // items in cart
              const TCartItems(
                showAddRemoveButtons: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              // coupon Textfield

              const TCouponCode(),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              // -- billing section
              TRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.black : TColors.white,
                child: const Column(
                  children: [
                    // pricing
                    TBillingAmountSection(),
                    SizedBox(height: TSizes.spaceBtwItems,),
                    // divider
                    Divider(),
                    SizedBox(height: TSizes.spaceBtwItems,),
                    // payment emthod
                    TBillingPaymentSection(),
                    SizedBox(height: TSizes.spaceBtwItems,),
                    // address
                    TBillingAddressSection()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      // checkout
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(
              () =>  SuccessScreen(image: TImages.successfulPaymentIcon,
                  title: 'Payment Success',
                  subtitle: 'Your item will be shipped soon!',
                  onPressed: () => Get.offAll(() => const NavigationMenu())
              )
          ),
          child: const Text('Checkout \$390'),
        ),
      ),
    );
  }
}


