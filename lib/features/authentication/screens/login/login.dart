import 'package:e_commerce_project/comman/styles/spacing_styles.dart';
import 'package:e_commerce_project/features/authentication/screens/login/widgets/login_form.dart';
import 'package:e_commerce_project/features/authentication/screens/login/widgets/login_header.dart';
import 'package:e_commerce_project/utils/constants/sizes.dart';
import 'package:e_commerce_project/utils/constants/text_strings.dart';
import 'package:e_commerce_project/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../comman/widgets/login_signup/form_divider.dart';
import '../../../../comman/widgets/login_signup/social_buttons.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              // logo , title & subtitle
              TLoginHeader(dark: dark),
              // form
              const TLoginForm(),
            //   divider
               TformDivider(dividerText: TTexts.orSignInWith.capitalize!,),
            const SizedBox(height: TSizes.spaceBtwSections,),
            //   footer
              const TSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}







