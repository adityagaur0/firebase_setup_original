// ? Simple class with variables
// !  and have single function Signup function
import 'package:firebase_setu_original/src/data/repository/authentication/authentication_repository.dart';
import 'package:firebase_setu_original/src/data/repository/user_repository/user_repository.dart';
import 'package:firebase_setu_original/src/features/authentication/models/user_modal.dart';
import 'package:firebase_setu_original/src/features/authentication/screens/signup/verify_email.dart';
import 'package:firebase_setu_original/src/utils/constants/image_strings.dart';
import 'package:firebase_setu_original/src/utils/helpers/network_manager.dart';
import 'package:firebase_setu_original/src/utils/popups/full_screen_loader.dart';
import 'package:firebase_setu_original/src/utils/popups/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  /*
  'Get.find()' simply a getter method, returning the signup controller again, a instance of this class
  normal instance 'SignupController()' this create a new instance , the reason to use getx here is
  it is going to save us lot of memory.cuz we not going to recreate instances for this signup controller.
   */

  // variables
  //! below means hidepass = true. means hide this password.
  // obs,return this variable to observer variable. now this variable is going to be observed by some wdgt. whenever this wgt value change it redraws the state.
  final hidePassword = true.obs; // observable to hide and showpassword.
  final email = TextEditingController(); //controller for email input
  final username = TextEditingController(); //controller for username input
  final lastname = TextEditingController(); //controller for lasrname input
  final password = TextEditingController(); //controller for password input
  final firstname = TextEditingController(); //controller for first name
  final phoneNo = TextEditingController(); //controller for email input
  GlobalKey<FormState> formKey =
      GlobalKey<FormState>(); //form key for form validation

  Future<void> signup() async {
    try {
      // 1. Start Loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your info', TImages.docerAnimation);

      // 2. Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }

      // 3. Form Validation
      if (!formKey.currentState!.validate()) {
        return;
      }

      // 4. Privacy Policy Check // TODO : video35 27:13

      // 5. Register user in the Firebase Authentication & Save user data in the Firebase
      final userCredential = await AuthenticationRepository.instance
          .registerUserWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );

      // // 6. Save Authenticated user data in the Firebase Firestore
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstname.text.trim(),
          lastName: lastname.text.trim(),
          username: username.text.trim(),
          email: email.text.trim(),
        //  password: password.text.trim(),
          phoneNo: phoneNo.text.trim(),
          profilePicture: '');

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);
      //remove loader
      TFullScreenLoader.stopLoading();

      // 7. Show Success Message
      TLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your account has been created! verify email to continue.');

      // 8. move to verify email screen
      Get.to(() =>EmailVerificationScreen(email: email.text.trim(),));
    } catch (e) {
      //remove loader
      TFullScreenLoader.stopLoading();
      //show some generic error to user
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
