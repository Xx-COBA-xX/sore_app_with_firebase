import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sore_app_with_firebase/feaures/shop/models/categories/categories_model.dart';

import '../../../core/utils/exceptions/firebase_auth_exceptions.dart';
import '../../../core/utils/exceptions/format_excepations.dart';
import '../../services/firabase_services.dart';

class CategoriesRepository extends GetxController {
  static CategoriesRepository get instance => Get.find();

  /// [varibal]
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  ///* [get all categories]
  Future<List<CategoriesModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection("Categories").get();
      final list = snapshot.docs
          .map((document) => CategoriesModel.formSnapshot(document))
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

  Future<void> uploadDumyData(List<CategoriesModel> categories) async {
    try {
      final storage = Get.put(TFirebaseStoragesService());
      for (var category in categories) {
        final image = await storage.getImageFromAssets(category.image);
        final url = await storage.uploadImageData(
            path: "Categories", image: image, name: category.name);
        category = CategoriesModel(
            name: category.name,
            image: url,
            parentId: category.parentId,
            isFeatured: category.isFeatured,
            id: category.id);

        await _db
            .collection("Categories")
            .doc(category.id)
            .set(category.toJson());
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
}
