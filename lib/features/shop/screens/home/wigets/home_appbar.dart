import 'package:e_commerce_project/comman/widgets/loaders/shimmer.dart';
import 'package:e_commerce_project/features/personalization/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../comman/widgets/appbar/appbar.dart';
import '../../../../../comman/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(TTexts.homeAppbarTitle, style:  Theme.of(context).textTheme.labelMedium!.apply(color: TColors.grey),),
          Obx( () {
        if(controller.profileLoading.value) {
        return const TShimmerEffect(width: 80, height: 15);
         } else {
          return Text(controller.user.value.fullName, style:  Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),);
         }
          }),
        ],
      ),
      actions: [
        TCartCounterIcon(
          onPressed: () {},
          iconColor: TColors.white,
        )
      ],
    );
  }
}