import 'package:e_commerce_project/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce_project/features/personalization/screens/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../images/t_circular_images.dart';

class TUserProfile extends StatelessWidget {
  const TUserProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    final networkImage = controller.user.value.profilePicture;
    return ListTile(
      leading: TCircularImages(
        image: networkImage.isNotEmpty ? networkImage : TImages.userIcon,
        width: 50,
        height: 50,
        padding: 0,
        isNetworkImage: networkImage.isNotEmpty ? true : false,
      ),
      title: Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),),
      subtitle: Text(controller.user.value.email, style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),),
      trailing: IconButton(onPressed: () => Get.to(() => const ProfileScreen(),), icon: const Icon(Iconsax.edit, color: TColors.white,),),
    );
  }
}