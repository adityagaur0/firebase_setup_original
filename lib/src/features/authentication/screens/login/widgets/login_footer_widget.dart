import 'package:firebase_setu_original/src/common/widgets/login_signup/form_divider.dart';
import 'package:firebase_setu_original/src/common/widgets/login_signup/social_buttons.dart';
import 'package:firebase_setu_original/src/utils/constants/colors.dart';
import 'package:firebase_setu_original/src/utils/constants/image_strings.dart';
import 'package:firebase_setu_original/src/utils/constants/sizes.dart';
import 'package:firebase_setu_original/src/utils/constants/text_strings.dart';
import 'package:firebase_setu_original/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        
        // const SizedBox(
        //   height: tFormHeight - 20,
        // ),
        // TextButton(
        //   onPressed: () {
        //     Get.off(() => const SignUpScreen());
        //     // Navigator.push(
        //     //     context, MaterialPageRoute(builder: (cnt) => SignUpScreen()));
        //   },
        //   child: Text.rich(
        //     TextSpan(
        //         text: tAlreadyHaveAnAccount,
        //         style: Theme.of(context).textTheme.bodyLarge,
        //         children: [
        //           TextSpan(
        //               text: tSignup,
        //               style: const TextStyle(color: Colors.blue)),
        //         ]),
        //   ),
        // ),
      ],
    );
  }
}


