import 'package:e_commerce_project/data/repositories/authentication/user_repository.dart';
import 'package:e_commerce_project/features/authentication/screens/login/login.dart';
import 'package:e_commerce_project/features/authentication/screens/onboarding/onboarding.dart';
import 'package:e_commerce_project/features/authentication/screens/signup/verify_email.dart';
import 'package:e_commerce_project/navigation_menu.dart';
import 'package:e_commerce_project/utils/excetptions/exceptions.dart';
import 'package:e_commerce_project/utils/excetptions/firebase_auth_exceptions.dart';
import 'package:e_commerce_project/utils/excetptions/format_exception.dart';
import 'package:e_commerce_project/utils/excetptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {

  static AuthenticationRepository get instance => Get.find();
  
  
  // variables
final deviceStorage = GetStorage();
final _auth = FirebaseAuth.instance;

// Get authentication user data
  User? get authUser => _auth.currentUser;

// called from main.dart an app launch

@override
  void onReady() {
  FlutterNativeSplash.remove();
  screenRedirect();
}

// function to show relevant screen
 screenRedirect() async {
  final user = _auth.currentUser;
  if(user != null ) {
    if(user.emailVerified) {
      Get.offAll(() => const NavigationMenu());
    } else {
      Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email ));
    }
  } else {
    // local storage
    deviceStorage.writeIfNull('isFirstTime', true);

    //   if(kDebugMode) {
    //       print('running it');
    //       print(deviceStorage.read('isFirstTime'));
    // }
    deviceStorage.read('isFirstTime') != true ? Get.off(() => const LoginScreen())  : Get.offAll(() => const OnBoardingScreen());
  }

 }

 /* ------------------------------ Email & password sign-in---------------------------------*/
  // login
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try{
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch(e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  // google sign in
  Future<UserCredential?> signInWithGoogle() async {
    try{
      // trigger the authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      // obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;

      // create a new credential
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // once sign in, return the userCredential
      return await _auth.signInWithCredential(credentials);

    } on FirebaseAuthException catch(e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch(_) {
      throw const TFormatException();
    } on PlatformException catch(e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

// register
Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
  try{
    return await _auth.createUserWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch(e) {
    throw TFirebaseAuthException(e.code).message;
  } on FirebaseException catch(e) {
    throw TFirebaseException(e.code).message;
  } on PlatformException catch(e) {
    throw TPlatformException(e.code).message;
  } catch (e) {
    throw 'Something went wrong, Please try again';
  }
}

// mail verification
Future<void> sendEmailVerification() async {
  try{
    await _auth.currentUser?.sendEmailVerification();
  } on FirebaseAuthException catch(e) {
    throw TFirebaseAuthException(e.code).message;
  } on FirebaseException catch(e) {
    throw TFirebaseException(e.code).message;
  } on PlatformException catch(e) {
    throw TPlatformException(e.code).message;
  } catch (e) {
    throw 'Something went wrong, Please try again';
  }
}

// forget password
  Future<void> sendPasswordResetEmail(String email) async {
    try{
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch(e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch(e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

// logout
Future<void> logout() async {
  try{
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
    Get.offAll(() => const LoginScreen());
  } on FirebaseAuthException catch(e) {
    throw TFirebaseAuthException(e.code).message;
  } on FirebaseException catch(e) {
    throw TFirebaseException(e.code).message;
  } on PlatformException catch(e) {
    throw TPlatformException(e.code).message;
  } catch (e) {
    throw 'Something went wrong, Please try again';
  }
}

// re authenticate with email and password
  Future<void> reAuthenticateWithEmailAndPassword(String email, String password) async {
    try{

      // create credential
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);

      // re authenticate
      await _auth.currentUser!.reauthenticateWithCredential(credential);

    } on FirebaseAuthException catch(e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch(e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

// delete account
  Future<void> deleteAccount() async {
    try{
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch(e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch(e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

}