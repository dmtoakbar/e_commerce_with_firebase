import 'package:e_commerce_project/features/authentication/controllers/login/login_controller.dart';
import 'package:e_commerce_project/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:e_commerce_project/features/authentication/screens/signup/signup.dart';
import 'package:e_commerce_project/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: TSizes.spaceBtwSections
          ),
          child: Column(
            children: [
              //   email
              TextFormField(
                controller: controller.email,
                validator: (value) => TValidator.validateEmail(value),
                decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: TTexts.email
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields,),
              //   password
              Obx(
                    () => TextFormField(
                  controller: controller.password,
                  validator: (value) => TValidator.validateEmptyText('Password', value),
                  obscureText: controller.hidePassword.value,
                  decoration: InputDecoration(
                      labelText: TTexts.password,
                      prefixIcon: const Icon(Iconsax.password_check),
                      suffixIcon: IconButton(
                          onPressed: () => controller.hidePassword.value =
                          !controller.hidePassword.value,
                          icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye))),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields/2,),
              // remember me & forget password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // remember me
                  Row(
                    children: [
                      Obx(() => Checkbox(value: controller.rememberMe.value, onChanged: (value) { controller.rememberMe.value = !controller.rememberMe.value;})),
                      const Text(TTexts.rememberMe)
                    ],
                  ),
                  TextButton(onPressed: () => Get.to(() => const ForgetPassword()), child: const Text(TTexts.forgetPassword))
                  //   forget password
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwSections,),
              //   sign in buttn
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () => controller.emailAndPasswordSignIn(), child: const Text(TTexts.signIn))
              ),
              const SizedBox(height: TSizes.spaceBtwItems,),
              //   create account
              SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(onPressed: () => Get.to(()=> const SignupScreen()), child: const Text(TTexts.createAccount))
              ),
            ],
          ),
        )
    );
  }
}