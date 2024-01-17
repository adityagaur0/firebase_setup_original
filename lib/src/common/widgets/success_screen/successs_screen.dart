import 'package:firebase_setu_original/src/common/styles/spacing_styles.dart';
import 'package:firebase_setu_original/src/utils/constants/sizes.dart';
import 'package:firebase_setu_original/src/utils/constants/text_strings.dart';
import 'package:firebase_setu_original/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.imgage,
      required this.title,
      required this.subTitle,
      required this.onPressed});

  final String imgage, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// ---1. IMAGE
              Image(
                image: AssetImage(imgage),
                width: THelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              ///

              /// ---2.Title and Subtitle
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              //
              const SizedBox(height: TSizes.spaceBtwItems),
              //
              //
              Text(subTitle,
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
                  onPressed: onPressed,
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
            ],
          ),
        ),
      ),
    );
  }
}
