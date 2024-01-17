import 'package:firebase_setu_original/src/features/authentication/controllers/onboarding/onboarding_controller.dart';
//import 'package:firebase_setu_original/src/features/authentication/controllers/onboarding_controller.dart';
import 'package:firebase_setu_original/src/utils/constants/colors.dart';
import 'package:firebase_setu_original/src/utils/constants/sizes.dart';
import 'package:firebase_setu_original/src/utils/device/device_utility.dart';
import 'package:firebase_setu_original/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
      right: TSizes.defaultSpace,
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () => OnboardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: dark ? TColors.primary : Colors.black),
        child: const Icon(Icons.arrow_forward_ios_outlined),
      ),
    );
  }
}
