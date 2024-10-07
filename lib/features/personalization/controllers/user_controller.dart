import 'package:e_commerce_project/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce_project/data/repositories/authentication/user_repository.dart';
import 'package:e_commerce_project/features/authentication/models/user_model.dart';
import 'package:e_commerce_project/features/authentication/screens/login/login.dart';
import 'package:e_commerce_project/features/personalization/screens/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:e_commerce_project/utils/constants/image_strings.dart';
import 'package:e_commerce_project/utils/constants/sizes.dart';
import 'package:e_commerce_project/utils/popup/full_screen_loader.dart';
import 'package:e_commerce_project/utils/popup/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/device/network_mananger.dart';

class UserController extends GetxController {

  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final imageUploading = false.obs;

  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  final userRepository = Get.put(UserRepository());


  @override
  void onInit() {
   super.onInit();
   fetchUserRecord();
  }


  // delete action
  // delete account warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(TSizes.md),
      title:  'Delete Account',
      middleText: 'Are you sure, you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.',
      confirm: ElevatedButton(
          onPressed: () async => deleteUserAccount(),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red, side: const BorderSide(color: Colors.red)
          ),
          child: const Padding(padding: EdgeInsets.symmetric(horizontal: TSizes.lg), child: Text('Delete'),)
      ),
      cancel: OutlinedButton(onPressed: () => Navigator.of(Get.overlayContext!).pop() , child: const Text('Cancel'))
    );
  }

  // delete account
  Future<void> deleteUserAccount() async {
    try {
     TFullScreenLoader.openLoadingDialog("Processing...", TImages.docerAnimation);

     // first re-authenticate user
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e) => e.providerId).first;
      if(provider.isNotEmpty) {
        // re verify auth email
        if(provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          TFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if(provider == 'password') {
          TFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
    TFullScreenLoader.stopLoading();
    TLoaders.warningSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  // verify account
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
     TFullScreenLoader.openLoadingDialog("Processing", TImages.docerAnimation);

     // check internet connectivity
     final isConnected = await NetworkManager.instance.isConnected();
     if(!isConnected) {
       TFullScreenLoader.stopLoading();
       return;
     }

     // form validation
     if(!reAuthFormKey.currentState!.validate()) {
       TFullScreenLoader.stopLoading();
       return;
     }

     await AuthenticationRepository.instance.reAuthenticateWithEmailAndPassword(verifyEmail.text.trim(), verifyPassword.text.trim());
     await AuthenticationRepository.instance.deleteAccount();

     TFullScreenLoader.stopLoading();
     Get.offAll(() => const LoginScreen());

    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  // end delete action

  // fetch user record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  // save user record from any registration provider

  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
        // refresh user record, first update Rx user add then check if user data is already stored. if not, store new data
      await fetchUserRecord();

      // if no record already stored
      if(user.value.id.isEmpty) {
        if (userCredential != null) {
          // convert name to first and last name
          final nameParts = UserModel.nameParts(
              userCredential.user!.displayName ?? '');
          final username = UserModel.generateUsername(
              userCredential.user!.displayName ?? '');
          // map data
          final user = UserModel(
            id: userCredential.user!.uid,
            firstName: nameParts[0],
            lastName: nameParts.length > 1
                ? nameParts.sublist(1).join(' ')
                : '',
            username: username,
            email: userCredential.user!.email ?? '',
            phoneNumber: userCredential.user!.phoneNumber ?? '',
            profilePicture: userCredential.user!.photoURL ?? '',
          );
          // save user data
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      TLoaders.warningSnackBar(
        title: 'Data not saved',
        message: 'Something went wrong while saving your information. you can re-save your data in your profile.',
      );
    }
  }

  // upload profile of user
  Future<void> uploadUserProfilePicture() async {
   try {
     final image = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 70, maxHeight: 512, maxWidth: 512);
     if(image != null) {
       imageUploading.value = true;
       // upload image
       final imageUrl = await userRepository.uploadImage('Users/Images/Profile/', image);

       // update user image record
       Map<String, dynamic> json = {'ProfilePicture': imageUrl};
       await userRepository.updateSingleField(json);
       user.value.profilePicture = imageUrl;
       user.refresh();

       TLoaders.successSnackBar(title: "Congratulations", message: 'Your Profle Image has been updated...!');
     }
   } catch (e) {
     TLoaders.errorSnackBar(title: 'Oh Snap', message: 'Something went wrong : $e');
   } finally {
     imageUploading.value = false;
   }
  }

}