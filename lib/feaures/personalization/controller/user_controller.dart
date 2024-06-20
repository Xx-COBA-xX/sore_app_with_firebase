import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sore_app_with_firebase/core/common/widgets/loaders/t_loaders.dart';
import 'package:sore_app_with_firebase/feaures/authentication/models/user/user_model.dart';

import '../../../data/user/user_repositry.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  Future<void> saveRecord(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        final fullName =
            UserModel.namePars(userCredential.user?.displayName ?? " ");
        final username = UserModel.generateUsername(fullName);
        final user = UserModel(
            firstName: fullName[0],
            lastName: fullName.length > 1 ? fullName.sublist(1).join(" ") : " ",
            email: userCredential.user?.email ?? " ",
            phoneNumber: userCredential.user?.phoneNumber ?? " ",
            username: username,
            profilePicture: userCredential.user?.photoURL ?? " ",
            uid: userCredential.user?.uid ?? " ");
        final UserRepository userRepository = Get.put(UserRepository());
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      TLoaders.errorSnackBar(title: "Data not saved", message:"Some thing was worng to save your information, You can re-save your data in your profilo");
    }
  }
}
