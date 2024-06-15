import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:sore_app_with_firebase/core/common/widgets/loaders/t_loaders.dart';
import 'package:sore_app_with_firebase/feaures/authentication/models/user/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find<UserRepository>();

  final _db = FirebaseFirestore.instance;

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection('users').doc(user.uid).set(user.toJson());
    } on FirebaseException catch (e) {
      TLoaders.errorSnackBar(
          message: e.message, title: "save user record error");
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
