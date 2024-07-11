import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sore_app_with_firebase/feaures/shop/models/prodcut/pruduct_model.dart';

import '../../../core/utils/exceptions/firebase_auth_exceptions.dart';
import '../../../core/utils/exceptions/format_excepations.dart';

class ProductRepo extends GetxController {
  static ProductRepo get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<ProductModel>> getProducts() async {
    // Fetch products from API
    try {
      final snapshot = await _db
          .collection("Products")
          .where("isFeatured", isEqualTo: true)
          .limit(4)
          .get();
      return snapshot.docs
          .map((element) => ProductModel.fromSnapshot(element))
          .toList();
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

  Future<List<ProductModel>> getAllProducts() async {
    // Fetch products from API
    try {
      final snapshot = await _db
          .collection("Products")
          .where("isFeatured", isEqualTo: true)
          .get();
      return snapshot.docs
          .map((element) => ProductModel.fromSnapshot(element))
          .toList();
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

  Future<List<ProductModel>> getProductsByQuery(Query query) async {
    // Fetch products from API
    try {
      final snapshot = await query.get();
      return snapshot.docs
          .map((product) => ProductModel.fromQuerySnapshot(product))
          .toList();
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

  Future<List<ProductModel>> getBrandProducts(
      {required String brandId, int limit = -1}) async {
    // Fetch products from API
    try {
      final list = limit == -1
          ? await _db
              .collection("Products")
              .where("brand.id", isEqualTo: brandId)
              .get()
          : await _db
              .collection("Products")
              .where("brand.id", isEqualTo: brandId)
              .limit(limit)
              .get();
      return list.docs
          .map((product) => ProductModel.fromSnapshot(product))
          .toList();
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

  Future<List<ProductModel>> getProductsForCategory(
      {required String categoryId, int limit = -1}) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> list = limit == -1
          ? await _db
              .collection("ProductsCategory")
              .where("categoryId", isEqualTo: categoryId)
              .get()
          : await _db
              .collection("ProductsCategory")
              .where("categoryId", isEqualTo: categoryId)
              .limit(limit)
              .get();

      final List<String> productsIds =
          list.docs.map((doc) => doc["productId"] as String).toList();

      if (productsIds.isEmpty) {
        return [];
      }

      final QuerySnapshot<Map<String, dynamic>> productsQuery = await _db
          .collection("Products")
          .where(FieldPath.documentId, whereIn: productsIds)
          .get();

      return productsQuery.docs
          .map((product) => ProductModel.fromSnapshot(product))
          .toList();
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


  Future<List<ProductModel>> getFavoriteProducts({
    required List<String> productsIds,
  }) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> productsQuery = await _db
          .collection("Products")
          .where(FieldPath.documentId, whereIn: productsIds)
          .get();

      return productsQuery.docs
          .map((product) => ProductModel.fromSnapshot(product))
          .toList();
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
}
