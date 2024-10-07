import 'package:e_commerce_project/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce_project/data/repositories/authentication/user_repository.dart';
import 'package:e_commerce_project/features/authentication/models/user_model.dart';
import 'package:e_commerce_project/features/authentication/screens/signup/verify_email.dart';
import 'package:e_commerce_project/utils/constants/image_strings.dart';
import 'package:e_commerce_project/utils/device/network_mananger.dart';
import 'package:e_commerce_project/utils/popup/full_screen_loader.dart';
import 'package:e_commerce_project/utils/popup/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // variable
  final hidePassword = true.obs; // Observable for hiding / showing
  final privacyPolicy = true.obs; // observable for privacy policy acceptance
  final email = TextEditingController();// controller for email input
  final lastName = TextEditingController();//controller for last name input
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>(); // form key for form validation


  // signup
Future<void> signup() async {

  try {
    // try loading
    TFullScreenLoader.openLoadingDialog('We are processing your information', TImages.docerAnimation);

    // check internet connectivity
    final isConnected = await NetworkManager.instance.isConnected();
     if(!isConnected) {
       TFullScreenLoader.stopLoading();
       return;
     }

    // form validation
    if(!signupFormKey.currentState!.validate()) {
      TFullScreenLoader.stopLoading();
      return;
    }

    // Privacy Policy check
    if(!privacyPolicy.value) {
      TLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
        message: 'In order to create account, you must have to read and accept the privacy policy & terms of use'
      );
      return;
    }

    // Register user in the firebase authentication and save user data in the firestore
   final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

    // save authenticated user data in the firebase firestore
    final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: ''
    );

    final userRepository = Get.put(UserRepository());
    await userRepository.saveUserRecord(newUser);


    // show success message
    TLoaders.successSnackBar(
        title: 'Congratulations',
      message: 'Your account has been created! verify email to continue'
    );

    // move to verify email screen
    Get.to(() => VerifyEmailScreen(email: email.text.trim(),));


  } catch(e) {
    // remove loader
    TFullScreenLoader.stopLoading();
   // show some generic error to the user
    TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
  }

}


}