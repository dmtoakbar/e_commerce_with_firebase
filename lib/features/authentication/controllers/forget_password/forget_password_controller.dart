import 'package:e_commerce_project/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce_project/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:e_commerce_project/utils/constants/image_strings.dart';
import 'package:e_commerce_project/utils/popup/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../utils/device/network_mananger.dart';
import '../../../../utils/popup/loaders.dart';

class ForgetPasswordController extends GetxController {
  
  static ForgetPasswordController get instance => Get.find();
  
  // variables
 final email = TextEditingController();
 
 GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();
 
 // send reset password email

sendPasswordResetEmail() async {
  try {
    // start loading
    TFullScreenLoader.openLoadingDialog("Processing your request...", TImages.docerAnimation);

    // check internet connectivity
    final isConnected = await NetworkManager.instance.isConnected();
    if(!isConnected) {
      TFullScreenLoader.stopLoading();
      return;
    }

    // form validation
    if(!forgetPasswordFormKey.currentState!.validate()) {
      TFullScreenLoader.stopLoading();
      return;
    }
    // send email to reset password
    await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());
    
    // remove loader
    TFullScreenLoader.stopLoading();
    
    // show Success Screen
    TLoaders.successSnackBar(title: 'Email Sent', message: 'Email link sent to reset your password'.tr);
    
    // redirect 
    Get.to(() => ResetPasswordScreen(email: email.text.trim(),));
  } catch (e) {
    // remove loader
    TFullScreenLoader.stopLoading();
    // show some generic error to the user
    TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    
  }
  
}

resendPasswordResetEmail(String email) async {
  try {
    // start loading
    TFullScreenLoader.openLoadingDialog("Processing your request...", TImages.docerAnimation);

    // check internet connectivity
    final isConnected = await NetworkManager.instance.isConnected();
    if(!isConnected) {
      TFullScreenLoader.stopLoading();
      return;
    }

    // send email to reset password
    await AuthenticationRepository.instance.sendPasswordResetEmail(email);

    // remove loader
    TFullScreenLoader.stopLoading();

    // show Success Screen
    TLoaders.successSnackBar(title: 'Email Sent', message: 'Email link sent to reset your password'.tr);

  } catch (e) {
    // remove loader
    TFullScreenLoader.stopLoading();
    // show some generic error to the user
    TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());

  }
}

}