import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_setu_original/src/features/authentication/screens/login/login.dart';
import 'package:firebase_setu_original/src/features/authentication/screens/onboarding.dart';
import 'package:firebase_setu_original/src/features/authentication/screens/signup/verify_email.dart';
import 'package:firebase_setu_original/src/features/core/screens/dashboard.dart';
import 'package:firebase_setu_original/src/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:firebase_setu_original/src/utils/exceptions/firebase_exceptions.dart';
import 'package:firebase_setu_original/src/utils/exceptions/format_exceptions.dart';
import 'package:firebase_setu_original/src/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

/*
? THIS AUTHENTICATION REPO WORK
  ? 1. IF THE USER IS LOGGED IN redirect to home screen.
  ? 2. IF THE USER IS NOT LOGGED IN redirect to login screen.
  ? 3. if the user is logged in , email not verified  reddirect to verification screen.
  ? 4. if the user is new , redirect to user onBoarding screen.

 */

class AuthenticationRepository extends GetxController {
  // a normal call with getxcontroller. can use diff state management too.
  static AuthenticationRepository get instance => Get.find();
  // getter method can directly call auth repo get instance using get.find method.

  ///----  1.  Variables.
  ///
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  ///

  ///---- 2. Called from main.dart on app launch.
  @override
  void onReady() {
    // onReady function triggered when authentication repo called for fist time.
    /// 1. remove the splash screen.
    FlutterNativeSplash.remove();

    /// 2. call screenRedirect fn.
    screenRedirect();
  }

  /// Function to show relevant screen
  void screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const Dashboard());
      } else {
        Get.offAll(() => EmailVerificationScreen(
              email: _auth.currentUser?.email,
            ));
      }
    } else {
      //Local Storage
      deviceStorage.writeIfNull("IsFirstTime", true); // user First time
      deviceStorage.read("IsFirstTime") != true // user not first time
          ? Get.offAll(() =>
              const LoginScreen()) // Redirect to the Login Screen if the not the first time.
          : Get.offAll(() =>
              const OnboardingScreen()); // Redirect to the OnBoarding Screen if it's the first time.
    }
  }

/* ----------------------------------- Email & Password sign-in -----------------------------------*/
  /// [EmailAuthentication] - SignIn
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          // built in function firebase
          email: email,
          password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [EmailAuthentication] - REGISTER
  Future<UserCredential> registerUserWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          // built in function firebase
          email: email,
          password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [EmailVerification] - MAIL VERIFICATION
  ///
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
      // this line send the verification link to the user.
      // current user is the person who is trying to authenticate. first we let him to sign up
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [ReAuthenticate] - ReAuthenticate User

  /// [EmailAuthentication] - FORGET PASSWORD

/* ----------------------------------- Federated identity & social sign-in -----------------------------------*/

  /// [GoogleAuthentication] - GOOGLE
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      //Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      //Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      //once signed in , return the user credentials
      return await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) print('Something went wrong: $e');
      return null;
    }
  }

  /// [FacebookAuthentication] - FACEBOOK

/* ----------------------------------- ./end Federated identity & social sign-in -----------------------------------*/

  /// [LogoutUser] - Valid for any authentication.
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [DeleteUser] - Remove user Auth and Firestore Account.

  // we need firebase authentication and second is user which is authenticated and secondly being authenticated.
}
