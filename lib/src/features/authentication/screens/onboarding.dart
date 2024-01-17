import 'package:firebase_setu_original/src/features/authentication/controllers/onboarding/onboarding_controller.dart';

import 'package:firebase_setu_original/src/features/authentication/screens/onboarding/widgets/onboarding_navigation.dart';
import 'package:firebase_setu_original/src/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:firebase_setu_original/src/features/authentication/screens/onboarding/widgets/onboarding_pages.dart';
import 'package:firebase_setu_original/src/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:firebase_setu_original/src/utils/constants/image_strings.dart';

import 'package:firebase_setu_original/src/utils/constants/text_strings.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal scrollable pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: TTexts.onBoardingTitle1,
                subTitle: TTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: TTexts.onBoardingTitle2,
                subTitle: TTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: TTexts.onBoardingTitle3,
                subTitle: TTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          /// Skip button
          const OnBoardingSkip(),

          /// Dot Navigation SmoothPageIndicator
          const OnBoardingDotNavigation(),

          /// Circular button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
