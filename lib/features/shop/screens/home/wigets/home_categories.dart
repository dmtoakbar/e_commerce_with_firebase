import 'package:e_commerce_project/comman/widgets/loaders/category_shimmer.dart';
import 'package:e_commerce_project/features/shop/controllers/category_controller.dart';
import 'package:e_commerce_project/features/shop/screens/sub_categories/sub_categories.dart';
import 'package:e_commerce_project/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../comman/widgets/image_text_widgets/vertical_image_text.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());

    return Obx(
      () {
        if(categoryController.isLoading.value) return const TCategoryShimmer();

        if(categoryController.featuredCategories.isEmpty) return Center(child: Text('No data found..', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),);

          return SizedBox(
            height: 80,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: categoryController.featuredCategories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  final category = categoryController.featuredCategories[index];
                  return VerticalImageText(
                    image: category.image.isNotEmpty ? category.image : TImages.questionMark,
                    isNetworkImage: category.image.isNotEmpty ? true : false,
                    title: category.name,
                    onTap: () {
                      Get.to(() => const SubCategoriesScreen());
                    },
                  );
                }),
          );

      }
    );
  }
}