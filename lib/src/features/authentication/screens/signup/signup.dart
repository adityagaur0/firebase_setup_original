import 'package:firebase_setu_original/src/common/widgets/login_signup/form_divider.dart';
import 'package:firebase_setu_original/src/common/widgets/login_signup/social_buttons.dart';
import 'package:firebase_setu_original/src/features/authentication/screens/signup/widgets/signup_form_widget.dart';
import 'package:firebase_setu_original/src/utils/constants/colors.dart';
import 'package:firebase_setu_original/src/utils/constants/sizes.dart';
import 'package:firebase_setu_original/src/utils/constants/text_strings.dart';
import 'package:firebase_setu_original/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            LineAwesomeIcons.angle_left,
            color: dark ? TColors.light : TColors.dark,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              TTexts.signupTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            const SignUpForm(),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            FormDivider(
                dark: dark, dividerText: TTexts.orSignUpWith.capitalize!),
            // const SignUpFooterWidget(),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            const SocialButtons(),
          ],
        ),
      ),
    );
  }
}
