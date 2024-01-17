/*
1. fetch the data from the repo.(which is dealing with tha backend server).
2. once we fetch the data ,we pass the data to modal, modal going to transform the data form json , to easily understand.
? Firebase (json) -> modal ->pass data from repo ->controllers.
controllers dealing btw design and backend.
eg when click on
->> Create Acount 
          -> pass to controller -> it should show circular lodder 
          -> we check we have internet connection 
                                                ? RETURN INTERNEt issue
                                                : if not then -> Check form not validated 
                                                                                        ? throw error
                                                                                        : if form valided check if the ticked on privacy policy
                                                                                                                    ? if all done then it sent on email and pasword to authentication repo.
                                                                                                                                        ? so if in case we get error . it not going to store the data inside the firbase storage and skip the process
                                                                                                                                        : if no error: we successfully store the data -> it tries to store the data in firestore
                                                                                                                                                              ? once done , everything is processed -> show success message
                                                                                                                                                              -> then move toward next screen
                                                                                  
                                                                                      
                                                              
 */

import 'package:firebase_setu_original/src/features/authentication/controllers/signup/signup_controller.dart';
import 'package:firebase_setu_original/src/utils/constants/sizes.dart';
import 'package:firebase_setu_original/src/utils/constants/text_strings.dart';
import 'package:firebase_setu_original/src/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // created a instance of signup controller using get . put method
    final controller = Get.put(SignUpController());

    return Form(
      key: controller.formKey, // from controller
      child: Container(
        // padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10), //=20
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ------ 1.first and last name
            ///
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.firstname,
                    validator: (value) =>
                        TValidator.validateEmptyText('First name', value),
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: TTexts.firstName,
                      prefixIcon: Icon(Icons.person_outline_outlined),
                    ),
                  ),
                ),
                const SizedBox(
                  width: TSizes.spaceBtwInputFields,
                ),
                Expanded(
                  child: TextFormField(
                    controller: controller.lastname,
                    validator: (value) =>
                        TValidator.validateEmptyText('Last name', value),
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: TTexts.lastName,
                      prefixIcon: Icon(Icons.person_outline_outlined),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),

            ///

            /// ----- 2. USERNAME
            TextFormField(
              controller: controller.username,
              validator: (value) =>
                  TValidator.validateEmptyText('User name', value),
              expands: false,
              decoration: const InputDecoration(
                labelText: TTexts.username,
                prefixIcon: Icon(Icons.person_outline_outlined),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),

            ///
            ///
            ///
            /// ---- 3. Email
            TextFormField(
              controller: controller.email,
              validator: (value) => TValidator.validateEmail(value),
              expands: false,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                labelText: TTexts.email,
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),

            ///
            ///
            ///
            /// ---- 4.PHONE NO
            TextFormField(
              controller: controller.phoneNo,
              validator: (value) => TValidator.validatePhoneNumber(value),
              expands: false,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.phone),
                labelText: TTexts.phoneNo,
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),

            ///
            ///
            ///
            /// --- 5. Password
            Obx(
              // obs which going to observe the value and redraw the value if needed.
              () => TextFormField(
                controller: controller.password,
                validator: (value) => TValidator.validatePassword(value),
                expands: false,
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.fingerprint),
                  labelText: TTexts.password,
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value = !controller
                        .hidePassword
                        .value, // toggling the value again and again
                    icon: Icon(controller.hidePassword.value
                        ? Icons.remove_red_eye_outlined
                        : Icons.remove_red_eye),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.signup(),
                child: const Text("signup"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
