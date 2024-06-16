import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sore_app_with_firebase/bottom_nav_bar.dart';
import 'package:sore_app_with_firebase/core/utils/constants/valribals.dart';
import 'package:sore_app_with_firebase/core/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:sore_app_with_firebase/core/utils/exceptions/format_excepations.dart';
import 'package:sore_app_with_firebase/feaures/authentication/screens/login/login_screen.dart';
import 'package:sore_app_with_firebase/feaures/authentication/screens/signup/verifyemail_screen.dart';

import '../../../feaures/authentication/screens/onboarding/onboarding_screen.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance =>
      Get.find<AuthenticationRepository>();

  final _auth = FirebaseAuth.instance;
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRidrect();
  }

  void screenRidrect() async {
    final User? user = _auth.currentUser;
    final SharedPreferences divaiceStrorage =
        await SharedPreferences.getInstance();

    if (user != null) {
      if (user.emailVerified) {
        divaiceStrorage.setBool(IS_FIRST_TIME, false);
        Get.offAll(() => const BottomNavBar());
      } else {
        Get.offAll(() => const VerifyEmailScreen());
      }
    } else {
      divaiceStrorage.getBool(IS_FIRST_TIME) ??
          await divaiceStrorage.setBool(IS_FIRST_TIME, true);
      divaiceStrorage.getBool(IS_FIRST_TIME) != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnBoardingScreen());
    }
  }

  ///* Register with email and password
  Future<UserCredential> registerEmailAndPassword(
      {required String email, required String password}) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
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

  //* Email verify
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser!.sendEmailVerification();
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
  //* Login email and password

  Future<UserCredential> loginEmailAndPassword(
      {required String email, required String password}) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
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

  //* Sign out

  Future<void> signOut() async {
    try {
      await _auth.signOut();
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
