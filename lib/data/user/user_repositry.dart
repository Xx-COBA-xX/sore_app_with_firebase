import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sore_app_with_firebase/core/common/widgets/loaders/t_loaders.dart';
import 'package:sore_app_with_firebase/data/repository/authentication/auth_repositry.dart';
import 'package:sore_app_with_firebase/feaures/authentication/models/user/user_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../core/utils/exceptions/firebase_auth_exceptions.dart';
import '../../core/utils/exceptions/format_excepations.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find<UserRepository>();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection('Users').doc(user.uid).set(user.toJson());
    } on FirebaseException catch (e) {
      TLoaders.errorSnackBar(
          message: e.message, title: "save user record error");
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .get();
      if (documentSnapshot.exists) {
        return UserModel.formSnapShot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(code: e.code).errorMessage;
    } on FirebaseException catch (e) {
      throw Exception(
        e.message,
      );
    } on FormatException catch (e) {
      throw TFormatException(e.message).message;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> updateUserDetails(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.uid).update(user.toJson());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(code: e.code).errorMessage;
    } on FirebaseException catch (e) {
      throw Exception(
        e.message,
      );
    } on FormatException catch (e) {
      throw TFormatException(e.message).message;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> updateSingleFelid(Map<String, dynamic> json) async {
    try {
      await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .update(json);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(code: e.code).errorMessage;
    } on FirebaseException catch (e) {
      throw Exception(
        e.message,
      );
    } on FormatException catch (e) {
      throw TFormatException(e.message).message;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> deleteUserDetails(String? uid) async {
    try {
      await _db.collection("Users").doc(uid).delete();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(code: e.code).errorMessage;
    } on FirebaseException catch (e) {
      throw Exception(
        e.message,
      );
    } on FormatException catch (e) {
      throw TFormatException(e.message).message;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<String> uploadProfileImage(
      {required String path, required XFile image}) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = ref.getDownloadURL();
      return url;
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(code: e.code).errorMessage;
    } on FirebaseException catch (e) {
      throw Exception(
        e.message,
      );
    } on FormatException catch (e) {
      throw TFormatException(e.message).message;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
