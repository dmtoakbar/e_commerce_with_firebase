import 'package:e_commerce_project/data/repositories/authentication/user_repository.dart';
import 'package:e_commerce_project/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce_project/features/personalization/screens/profile/profile.dart';
import 'package:e_commerce_project/utils/constants/image_strings.dart';
import 'package:e_commerce_project/utils/popup/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../utils/device/network_mananger.dart';
import '../../../utils/popup/loaders.dart';

class UpdateNameController extends GetxController {

  // variables
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();


  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  // initialize name record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }



  // update user name
 Future<void> updateUserName() async {

    try {
      // start loading
      TFullScreenLoader.openLoadingDialog('We are updating your information...', TImages.docerAnimation);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if(!updateUserNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      // update user's first and last name in the firebase FireStore
      Map<String, dynamic> name = {'FirstName': firstName.text.trim(), 'LastName': lastName.text.trim()};
      await userRepository.updateSingleField(name);

      // update the Rx user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // remove loader
      TFullScreenLoader.stopLoading();

      // show success message
      TLoaders.successSnackBar(title: 'Congratulations', message: 'Your name has been updated.');

      // move to previous screen
      Get.off(() => const ProfileScreen());
    } catch (e) {
      // remove loader
      TFullScreenLoader.stopLoading();
      // show some generic error to the user
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }

 }
}