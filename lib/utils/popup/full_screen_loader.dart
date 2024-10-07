import 'package:e_commerce_project/comman/widgets/loaders/animation_Loader.dart';
import 'package:e_commerce_project/utils/constants/colors.dart';
import 'package:e_commerce_project/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TFullScreenLoader {
  
  static void openLoadingDialog(String text, String animation) {
    showDialog(
        context: Get.overlayContext!, // user get.overlaycontext for overlay dialogs
        barrierDismissible: false, // the dialog can not be dismissed by tapping outside it
        builder: (_) => PopScope(
            canPop: false, // disable popping with the back button
            child: Container(
              color: THelperFunctions.isDarkMode(Get.context!) ? TColors.dark : TColors.white,
              width: double.infinity,
              height: double.infinity,
              child: Column(
               children: [
                 const SizedBox( height:  250,), // adjust the spacing as needed
                  TAnimationLoaderWidget(text: text, animation: animation)
               ],
              ),
            )
        )
    );
  }

  // stop the current open loading dialog
 // this method doesn't return anything
static stopLoading() {
    Navigator.of(Get.context!).pop();
}
}