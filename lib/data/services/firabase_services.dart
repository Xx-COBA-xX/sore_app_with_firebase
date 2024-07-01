
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../core/utils/exceptions/firebase_auth_exceptions.dart';
import '../../core/utils/exceptions/format_excepations.dart';

class TFirebaseStoragesService extends GetxController {
  static TFirebaseStoragesService get instance => Get.find();

  Future<Uint8List> getImageFromAssets(String path) async {
    try {
      final byteDate = await rootBundle.load(path);
      final imageData = byteDate.buffer
          .asUint8List(byteDate.offsetInBytes, byteDate.lengthInBytes);
      return imageData;
    } catch (e) {
      throw Exception("Error getting image from assets: ${e.toString()}");
    }
  }

   Future<String> uploadImageData(
      {required String path, required Uint8List image, required String name}) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(name);
      await ref.putData(image);
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
