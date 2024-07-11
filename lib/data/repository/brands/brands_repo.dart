// ignore_for_file: avoid_print

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

  Future<List<BrandsModel>> getBrandsForCategory(String categoryId) async {
    try {
      QuerySnapshot snapshot = await _db
          .collection("BrandCategory")
          .where("categoryId", isEqualTo: categoryId)
          .get();

      List<String> brandIds =
          snapshot.docs.map((doc) => doc["brandId"] as String).toList();

      final brandQuery = await _db
          .collection("Brands")
          .where(FieldPath.documentId,
              whereIn: brandIds.take(10).toList()) // Take only the first 10 IDs
          .limit(2)
          .get();

      List<BrandsModel> list = brandQuery.docs
          .map((document) => BrandsModel.fromShapshot(document))
          .toList();

      return list;
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(code: e.code).errorMessage;
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    } on FormatException catch (e) {
      throw TFormatException(e.message).message;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Future<List<BrandsModel>> getBrandsForCategory(String categoryId) async {
  //   try {
  //     print("1 =============================");
  //     QuerySnapshot snapshot = await _db
  //         .collection("BrandCategory")
  //         .where("categoryId", isEqualTo: categoryId)
  //         .get();
  //     print("2 =============================");

  //     List<String> brandIds =
  //         snapshot.docs.map((doc) => doc["brandId"] as String).toList();
  //     print("3 =============================");

  //     final brandQuery = await _db
  //         .collection("Brands")
  //         .where(FieldPath.documentId, whereIn: brandIds)
  //         .limit(2)
  //         .get();

  //     print("4 =============================");

  //     List<BrandsModel> list = brandQuery.docs
  //         .map((document) => BrandsModel.fromShapshot(document))
  //         .toList();
  //     list.map((e) {
  //       print("5 ===================");
  //       print(e.name);
  //     });
  //     return list;
  //   } on FirebaseAuthException catch (e) {
  //     throw TFirebaseAuthException(code: e.code).errorMessage;
  //   } on FirebaseException catch (e) {
  //     throw Exception(
  //       e.message,
  //     );
  //   } on FormatException catch (e) {
  //     throw TFormatException(e.message).message;
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   }
  // }

  getBrandsForProduct(String brandId) {}
}
