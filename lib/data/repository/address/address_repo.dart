import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sore_app_with_firebase/data/repository/authentication/auth_repositry.dart';

import '../../../core/utils/exceptions/firebase_auth_exceptions.dart';
import '../../../core/utils/exceptions/format_excepations.dart';
import '../../../feaures/personalization/models/address_model.dart';

class AddressRepo extends GetxController {
  static AddressRepo get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<AddressModel>> getAllAddress() async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isNotEmpty) {
        final snapshot = await _db
            .collection("Users")
            .doc(userId)
            .collection("Address")
            .get();
        return snapshot.docs
            .map((document) => AddressModel.fromSnapshot(document))
            .toList();
      } else {
        throw Exception("User id is empty");
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

  Future<void> updateSelectAddress(String addressId, bool isSelect) async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;

      await _db
          .collection("Users")
          .doc(userId)
          .collection("Address")
          .doc(addressId)
          .update({"selectedAddress": isSelect});
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<String> addAddress(AddressModel newAddress)async{
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;

      final document = await _db.collection("Users").doc(userId).collection("Address").add(newAddress.toJson());
      return document.id;
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
