import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_setu_original/src/features/authentication/models/user_modal.dart';
import 'package:firebase_setu_original/src/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:firebase_setu_original/src/utils/exceptions/firebase_exceptions.dart';
import 'package:firebase_setu_original/src/utils/exceptions/format_exceptions.dart';
import 'package:firebase_setu_original/src/utils/exceptions/platform_exceptions.dart';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

/* step 2: contain all the queries to the firestore*/

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<void> saveUserRecord(UserModel user) async {
    try {
      return await _db.collection("Users").doc(user.id).set(user.toJson());
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

    //     .whenComplete(() {
    //   Get.snackbar("Success",
    //       "Your account has been created.",
    //       snackPosition: SnackPosition.BOTTOM,
    //       backgroundColor: Colors.green.withOpacity(0.1),
    //       colorText: Colors.green);
    // }).catchError((error, stackTrace) {
    //   Get.snackbar("Error",
    //       "Something went wrong. Try again",
    //       snackPosition: SnackPosition.BOTTOM,
    //       backgroundColor: Colors.redAccent.withOpacity(0.1),
    //       colorText: Colors.red);
    //   print(error.toString());
    // });
  }

  // //store user in firestore.
  // createUser(UserModel user) async {
  //   await _db.collection("Users").add(user.toJson()).whenComplete(() {
  //     Get.snackbar("Success", "Your account has been created.",
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: Colors.green.withOpacity(0.1),
  //         colorText: Colors.green);
  //   }).catchError((error, stackTrace) {
  //     Get.snackbar("Error", "Something went wrong. Try again",
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: Colors.redAccent.withOpacity(0.1),
  //         colorText: Colors.red);
  //     print(error.toString());
  //   });
  // }

  // ///step 2 - Fetch All User or User Details
  // // Future<UserModel> getUserDetails(String email) async {
  // //   final snapshot =
  // //       await _db.collection("Users").where("Email", isEqualTo: email).get();
  // //   final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).
  // // single;
  // //   return userData;
  // // }
  // Future<UserModel?> getUserDetails(String email) async {
  //   final snapshot =
  //       await _db.collection("Users").where("Email", isEqualTo: email).get();

  //   if (snapshot.docs.isNotEmpty) {
  //     final userData = UserModel.fromSnapshot(snapshot.docs.first);
  //     return userData;
  //   } else {
  //     // Handle the case where no documents match the query.
  //     // You might want to return null or throw an exception based on your use case.
  //     return null;
  //   }
  // }

  // Future<List<UserModel>> allUser() async {
  //   final snapshot = await _db.collection("Users").get();
  //   final userData =
  //       snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
  //   return userData;
  // }

  // Future<void> updateUserRecord(UserModel user) async {
  //   await _db.collection("Users").doc(user.id).update(user.toJson());
  // }

  // Future<void> deleteUser(UserModel user) async {
  //   try {
  //     await _db.collection("Users").doc(user.id).delete();
  //     Get.snackbar("Success", "User deleted successfully.",
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: Colors.green.withOpacity(0.1),
  //         colorText: Colors.green);
  //   } catch (error) {
  //     Get.snackbar("Error", "Failed to delete user. Try again",
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: Colors.redAccent.withOpacity(0.1),
  //         colorText: Colors.red);
  //     print(error.toString());
  //   }
  // }
}
