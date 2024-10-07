import 'package:e_commerce_project/comman/widgets/login_signup/form_divider.dart';
import 'package:e_commerce_project/comman/widgets/login_signup/social_buttons.dart';
import 'package:e_commerce_project/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:e_commerce_project/utils/constants/sizes.dart';
import 'package:e_commerce_project/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // title
              Text(TTexts.signUpTitle, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSizes.spaceBtwSections,),
              // form
              const TSignupForm(),
              
              // divider
              const SizedBox(height: TSizes.spaceBtwSections,),
              TformDivider(dividerText: TTexts.orSignUpWith.capitalize!),

              // social button
              const SizedBox(height: TSizes.spaceBtwSections,),
              const TSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}


