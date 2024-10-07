import 'package:e_commerce_project/comman/texts/section_heading.dart';
import 'package:e_commerce_project/comman/widgets/appbar/appbar.dart';
import 'package:e_commerce_project/comman/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:e_commerce_project/comman/widgets/list_tile/settings_menu_tile.dart';
import 'package:e_commerce_project/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce_project/features/personalization/screens/address/address.dart';
import 'package:e_commerce_project/features/shop/screens/order/order.dart';
import 'package:e_commerce_project/utils/constants/colors.dart';
import 'package:e_commerce_project/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../comman/widgets/list_tile/user_profile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
                    TAppBar(title: Text('Account', style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white),), ),
                    const SizedBox(height: TSizes.spaceBtwSections,),
                    // user profile card
                    const TUserProfile(),
                    const SizedBox(height: TSizes.spaceBtwSections,)
                  ],
                )
            ),
            // body
            Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  // account settings
                  const TSectionHeading(title: 'Account Settings', showActionButton: false,),
                  const SizedBox(height: TSizes.spaceBtwItems,),

                  TSettingsMenuTile(
                      icon: Iconsax.safe_home,
                      title: 'My Addresses',
                      subTitle: 'Set shopping delivery address',
                      onTap: () => Get.to(() => const UserAddressScreen()),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subTitle: 'Add, remove products and move to checkout',
                    onTap: (){},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: 'My Orders',
                    subTitle: 'In-progress and Completed orders',
                    onTap: (){
                      Get.to(() => const OrderScreen());
                    },
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.bank,
                    title: 'My Account',
                    subTitle: 'Withdraw balance to registered bank account',
                    onTap: (){},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.discount_shape,
                    title: 'My Coupons',
                    subTitle: 'List Of all the discounted coupons',
                    onTap: (){},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.notification,
                    title: 'Notification',
                    subTitle: 'Set any kind of notification message',
                    onTap: (){},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.security_card,
                    title: 'Account Privacy',
                    subTitle: 'Manage data usage and connected accounts',
                    onTap: (){},
                  ),


                  // app settings
                  const SizedBox(height: TSizes.spaceBtwSections,),
                  const TSectionHeading(title: "App Settings", showActionButton: false,),
                  const SizedBox(height: TSizes.spaceBtwItems,),
                  TSettingsMenuTile(
                    icon: Iconsax.document_upload,
                    title: 'Load Data',
                    subTitle: 'Upload Data to your cloud firebase',
                    onTap: (){},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subTitle: 'Set recommendation based on location',
                    trailing: Switch(value: true, onChanged: (value) {},),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subTitle: 'Search result is sage of all users',
                    trailing: Switch(value: false, onChanged: (value) {},),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subTitle: 'Set image quality to be seen',
                    trailing: Switch(value: false, onChanged: (value) {},),
                  ),

                  // logout button
                  const SizedBox(height: TSizes.spaceBtwSections,),
                  SizedBox(width: double.infinity,
                  child: OutlinedButton(onPressed: () => AuthenticationRepository.instance.logout(), child: const Text('Logout'),)
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections * 2.5,)

                ],
              ),
            )
            
          ],
        ),
      ),
    );
  }
}


