import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sore_app_with_firebase/feaures/shop/models/brands/brands_model.dart';

import '../../../core/utils/exceptions/firebase_auth_exceptions.dart';
import '../../../core/utils/exceptions/format_excepations.dart';

class BrandsRepo extends GetxController {
  static BrandsRepo get instance => Get.find();

  final _db = FirebaseFirestore.instance;
 Future<List<BrandsModel>> getBrands() async {
    try {
      final snapshot = await _db.collection("Brands").get();
      final list = snapshot.docs
          .map((document) => BrandsModel.fromShapshot(document))
          .toList();
      return list;
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
