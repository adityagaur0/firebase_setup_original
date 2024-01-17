import 'package:firebase_setu_original/src/common/styles/spacing_styles.dart';
import 'package:firebase_setu_original/src/common/widgets/login_signup/form_divider.dart';
import 'package:firebase_setu_original/src/common/widgets/login_signup/social_buttons.dart';
import 'package:firebase_setu_original/src/features/authentication/screens/login/widgets/form_header_widget.dart';
import 'package:firebase_setu_original/src/features/authentication/screens/login/widgets/login_footer_widget.dart';
import 'package:firebase_setu_original/src/utils/constants/image_strings.dart';
import 'package:firebase_setu_original/src/utils/constants/sizes.dart';
import 'package:firebase_setu_original/src/utils/constants/text_strings.dart';
import 'package:firebase_setu_original/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    // final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: TSpacingStyle.paddingWithAppBarHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Logo,title & subTitle
                FormHeaderWidget(
                    image: dark ? TImages.lightAppLogo : TImages.darkAppLogo,
                    title: TTexts.loginTitle,
                    subTitle: TTexts.loginSubTitle),

                /// Form
                const LoginForm(),

                /// Divider
                FormDivider(
                  dark: dark,
                  dividerText: TTexts.orSignInWith.capitalize!,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwInputFields,
                ),

                //Social Buttons
                const SocialButtons(),

                //const LoginFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
