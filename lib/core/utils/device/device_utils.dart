// ignore_for_file: unused_import

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TDeviceUtils {
  //TODO: Should I know way use this method here?
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  //TODO : this
  static Future<void> setStatusBarColor(Color color) async {
    // await FlutterStatusbarcolor.setStatusBarColor(color);
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: color));
  }

  //TODO: this
  static bool isLandscapeOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom == 0;
  }

  // TODO: this
  static bool isPortraitOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom != 0;
  }

  //TODO this is very important
  static void getFullScreen(bool enable) {
    SystemChrome.setEnabledSystemUIMode(
        enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge);
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  // TODO:
  static double getPixelRatio(BuildContext context) {
    return MediaQuery.of(Get.context!).devicePixelRatio;
  }

  // TODO
  static double getStatusBarHeight(BuildContext context) {
    return MediaQuery.of(Get.context!).padding.top;
  }

  static double getBottomNavigationBarHeight(BuildContext context) {
    return kBottomNavigationBarHeight;
  }

  static double getAppBarHeight(BuildContext context) {
    return kToolbarHeight;
  }

  // TODO:
  static double getKeyboardHeight(BuildContext context) {
    final viewInsets = MediaQuery.of(Get.context!).viewInsets;

    return viewInsets.bottom;
  }

// TODO:
  static Future<bool> isKeyboardVisible(BuildContext context) async {
    final viewInsets = MediaQuery.of(Get.context!).viewInsets;
    return viewInsets.bottom != 0;
  }

// TODO
  static Future<bool> isPhysicalDevice() async {
    return defaultTargetPlatform == TargetPlatform.android &&
        defaultTargetPlatform == TargetPlatform.iOS;
  }

  static void vibrate(Duration duration) {
    HapticFeedback.vibrate();
    Future.delayed(duration, () => HapticFeedback.vibrate());
  }

// TODO
  static Future<void> setPreferredOrientation(
      List<DeviceOrientation> orientations) async {
    await SystemChrome.setPreferredOrientations(orientations);
  }

// TODO
  static void hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

// TODO
  static void showStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

// TODO:
  static Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  static bool isIOS() {
    return Platform.isIOS;
  }

  static bool isAndroid() {
    return Platform.isAndroid;
  }

  static void launcherUrl(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    }else{
      throw 'Could not launch $url';
    }
  }
}
