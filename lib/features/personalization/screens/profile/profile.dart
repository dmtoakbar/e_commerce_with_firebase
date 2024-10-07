import 'package:e_commerce_project/comman/texts/section_heading.dart';
import 'package:e_commerce_project/comman/widgets/appbar/appbar.dart';
import 'package:e_commerce_project/comman/widgets/images/t_circular_images.dart';
import 'package:e_commerce_project/comman/widgets/loaders/shimmer.dart';
import 'package:e_commerce_project/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:e_commerce_project/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:e_commerce_project/utils/constants/image_strings.dart';
import 'package:e_commerce_project/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../controllers/user_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            // profile picture
           SizedBox(
             width: double.infinity,
             child: Column(
               children: [
                 Obx( () {
                   final networkImage = controller.user.value.profilePicture;
                   final image = networkImage.isNotEmpty ? networkImage : TImages.userIcon;
                   if(controller.imageUploading.value) {
                     return const TShimmerEffect(width: 80, height: 80, radius: 80,);
                   } else {
                     return TCircularImages(image: image, width: 80, height: 80, isNetworkImage: networkImage.isNotEmpty ? true : false,);
                   }
                 }),
                 IconButton(onPressed: () => controller.uploadUserProfilePicture(), icon: const Icon(Iconsax.edit))
               ],
             ),
           ),
            // details
            const SizedBox(height: TSizes.spaceBtwItems / 2,),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems,),
            const TSectionHeading(title: 'Profile Information', showActionButton: false,),
            const SizedBox(height: TSizes.spaceBtwItems,),
            TProfileMenu(
              title: "name",
              value: controller.user.value.fullName,
              onPressed: () { Get.to(() => const ChangeName());  },
            ),
            TProfileMenu(
              title: "Username",
              value: controller.user.value.username,
              onPressed: () {  },
            ),

            const SizedBox(height: TSizes.spaceBtwItems,),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems,),
            // heading personal info
            const TSectionHeading(title: 'Personal Information', showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwItems ,),
            TProfileMenu(
              title: "User Id",
              value: controller.user.value.id,
              icon: Iconsax.copy,
              onPressed: () {  },
            ),
            TProfileMenu(
              title: "E-mail",
              value: controller.user.value.email,
              icon: Iconsax.copy,
              onPressed: () {  },
            ),
            TProfileMenu(
              title: "Phone Number",
              value: controller.user.value.phoneNumber,
              onPressed: () {  },
            ),
            TProfileMenu(
              title: "Gender",
              value: 'Male',
              onPressed: () {  },
            ),
            TProfileMenu(
              title: "Date of Birth",
              value: '10 oct 1994',
              onPressed: () {  },
            ),

            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems,),

            Center(
              child: TextButton(
                onPressed: () => controller.deleteAccountWarningPopup(),
                child: const Text('Close Account', style: TextStyle(color: Colors.red),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
