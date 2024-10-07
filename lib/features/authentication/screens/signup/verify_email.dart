import 'package:e_commerce_project/comman/widgets/success_screen/success_screen.dart';
import 'package:e_commerce_project/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce_project/features/authentication/controllers/singup/verify_email_controller.dart';
import 'package:e_commerce_project/features/authentication/screens/login/login.dart';
import 'package:e_commerce_project/features/authentication/screens/signup/signup.dart';
import 'package:e_commerce_project/utils/constants/image_strings.dart';
import 'package:e_commerce_project/utils/constants/sizes.dart';
import 'package:e_commerce_project/utils/constants/text_strings.dart';
import 'package:e_commerce_project/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});
 final String? email;
  @override
  Widget build(BuildContext context) {
    final VerifyEmailController controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => AuthenticationRepository.instance.logout() , icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // image
              Image(image: const AssetImage(TImages.deliveredEmailIllustration), width: THelperFunctions.screenWidth() * 1,),
              const SizedBox(height: TSizes.spaceBtwSections,),
              // title & subtitle
              Text(TTexts.confirmEmail, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBtwItems,),
              Text(email ?? '', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBtwItems,),
              Text(TTexts.confirmEmailSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBtwSections,),
              // button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () => Get.to(() => controller.checkEmailVerificationStatus()
                ), child: const Text(TTexts.tContinue),),
              ),
              const SizedBox(height: TSizes.spaceBtwItems,),
              SizedBox(
                width: double.infinity,
                child: TextButton(onPressed: () => controller.sendEmailVerification(), child: const Text(TTexts.resendEmail),),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
