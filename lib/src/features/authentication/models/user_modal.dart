// 1 create model

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_setu_original/src/utils/formatters/formatter.dart';

class UserModel {
  UserModel(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.username,
      required this.email,
      required this.phoneNo,
      required this.profilePicture});
  final String id;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String phoneNo;

  final String profilePicture;

  // ----------------- HELPER FN---------------- //(not imp)

  /// Helper function to get the full name.
  String get fullName => '$firstName $lastName';

  /// Helper function to format phone number.
  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNo);

  /// Static function to split full name into first and last name.
  static List<String> nameParts(fullName) => fullName.split(" ");

  /// Static function to generate a username from the full name.
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";
    String camelCaseUsername =
        "SfirstName$lastName"; // Combine first and last name
    String usernameWithPrefix = "cwt_ScamelCaseUsername"; // Add "cwt_" prefix
    return usernameWithPrefix;
  }

  //static fn to create empty user modal
  static UserModel empty() => UserModel(
        id: '',
        firstName: '',
        lastName: '',
        username: '',
        email: '',
        phoneNo: '',
        profilePicture: '',
      );

  // ------------------- HELPER FNN END -------------- //
//
  /// convert the modal to json structure to store the data in firebase.
  Map<String, dynamic> toJson() {
    return {
      "Firstname": firstName,
      "Lastname": lastName,
      "Username": username, // Use the actual username property here
      "Email": email,
      "Phone": phoneNo,
      "Profile picture": profilePicture // Corrected key
    };
  }

  /*
  becaus we going to store the data in firestore . firestore doesnot store in this way
    so need to add in json 
  */

  // toJson() {
  //   return {
  //     "FullName":
  //         fullName,
  //     "Email":
  //         email,
  //     "Phone":
  //         phoneNo,
  //     "Password":
  //         password
  //   };
  // }

  // ///Step1 Map user fetched from firebase to UserModal
  // factory UserModel.fromSnapshot(
  //     DocumentSnapshot<Map<String, dynamic>>
  //         document) {
  //   final data =
  //       document.data()!;
  //   return UserModel(
  //       id: document.id,
  //       email: data["Email"],
  //       password: data["Password"],
  //       fullName: data["FullName"],
  //       phoneNo: data["Phone"]);
  //}
}
