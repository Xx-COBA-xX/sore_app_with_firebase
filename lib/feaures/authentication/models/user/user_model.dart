import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sore_app_with_firebase/core/utils/formatters/app_formatter.dart';

class UserModel {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String username;
  final String uid;
  final String profilePicture;

  UserModel(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.phoneNumber,
      required this.username,
      required this.profilePicture,
      required this.uid});

  String get fullName => '$firstName $lastName';

  String get formatPhoneNumber => TFormatters.formatPhoneNumber(phoneNumber);

  static List<String> namePars(fullName) => fullName.split(" ");

  static generateUsername(fullName) {
    List<String> namePars = fullName.split(" ");
    String firstName = namePars[0].toLowerCase();
    String lastName = namePars.length > 1 ? namePars[1].toLowerCase() : "";

    String camelCaseUsername = firstName + lastName;
    String usernameWithPerfix = "_cwt+$camelCaseUsername";

    return usernameWithPerfix;
  }

  Map<String, dynamic> toJson() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "phoneNumber": phoneNumber,
      "username": username,
      "profilePicture": profilePicture,
      'uid': uid
    };
  }

  factory UserModel.formSnapShot(
      DocumentSnapshot<Map<String, dynamic>> documnt) {
    if (documnt.data() != null) {
      final data = documnt.data();
      return UserModel(
        firstName: data?['firstName'] ?? "",
        lastName: data?['lastName'] ?? "",
        email: data?['email'] ?? "",
        phoneNumber: data?['phoneNumber'] ?? "",
        username: data?['username'] ?? "",
        profilePicture: data?['profilePicture'] ?? "",
        uid: data?['uid'] ?? "",
      );
    } else {
      return UserModel.empty();
    }
  }

  factory UserModel.empty() {
    return UserModel(
      firstName: "",
      lastName: "",
      email: "",
      phoneNumber: "",
      username: "",
      profilePicture: "",
      uid: "",
    );
  }
}
