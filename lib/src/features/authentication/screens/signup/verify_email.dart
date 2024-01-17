import 'package:firebase_setu_original/src/common/widgets/success_screen/successs_screen.dart';
import 'package:firebase_setu_original/src/data/repository/authentication/authentication_repository.dart';
import 'package:firebase_setu_original/src/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:firebase_setu_original/src/features/authentication/screens/login/login.dart';
import 'package:firebase_setu_original/src/utils/constants/image_strings.dart';
import 'package:firebase_setu_original/src/utils/constants/sizes.dart';
import 'package:firebase_setu_original/src/utils/constants/text_strings.dart';
import 'package:firebase_setu_original/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key, this.email});
  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
        VerifyEmailController()); // this will trigger this controller and send the email for verification
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => AuthenticationRepository.instance.logout(),
            icon: const Icon(LineAwesomeIcons.times),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// ---1. IMAGE
              Image(
                image: const AssetImage(TImages.deliveredEmailIllustration),
                width: THelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              ///

              /// ---2.Title and Subtitle
              Text(
                TTexts.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              //
              const SizedBox(height: TSizes.spaceBtwItems),
              //
              Text(
                email ?? '',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              //
              const SizedBox(height: TSizes.spaceBtwItems),
              //
              Text(TTexts.confirmEmailSubTitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center),
              //
              const SizedBox(height: TSizes.spaceBtwSections),
              //

              /// --3. Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: const Text(TTexts.tContinue),
                  onPressed: () =>
                      controller.manuallyCheckEmailVerificationStatust(),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => controller.sendVerificationEmail(),
                  child: const Text(TTexts.resendEmail),
                ),
              ),
              // TextButton(
              //   onPressed: () => AuthenticationRepository.instance.logout(),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       const Icon(LineAwesomeIcons.alternate_long_arrow_left),
              //       const SizedBox(width: 5),
              //       Text(tBackToLogin.tr.toLowerCase()),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
