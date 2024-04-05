import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sore_app_with_firebase/core/utils/constants/colors.dart';

class THelperFunctions {
  static Color? getColor(String color) {
    switch (color) {
      case "Green":
        return Colors.green;
      case "Red":
        return Colors.red;
      case "Orange":
        return Colors.orange;
      case "Blue":
        return Colors.blue;
      case "Yellow":
        return Colors.yellow;
      case "Pink":
        return Colors.pink;
      case "Purple":
        return Colors.purple;
      case "Black":
        return Colors.black;
      case "White":
        return Colors.white;
      case "Grey":
        return Colors.grey;
      case "Brown":
        return Colors.brown;
      case "Cyan":
        return Colors.cyan;
      case "Teal":
        return Colors.teal;
      case "Amber":
        return Colors.amber;
      case "Lime":
        return Colors.lime;
      case "Indigo":
        return Colors.indigo;
      case "LightBlue":
        return Colors.lightBlue;
      default:
        return null;
    }
  }

  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  static void showGetSnackBar(String message) {
    Get.showSnackbar(GetSnackBar(
      backgroundColor: AppColors.lightGrey,
      message: message,
      duration: const Duration(seconds: 2),
    ));
  }

  static void showAlert(String title, String message) {
    showDialog(
      context: Get.context!,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  static void navigatorToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize(BuildContext context) {
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  static String getFormattedDate(DateTime date,
      {String format = 'dd MMM yyyy'}) {
    return DateFormat(format).format(date);
  }

  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  static List<Widget> warpWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(
          i, i + rowSize > widgets.length ? widgets.length : i + rowSize);
      wrappedList.add(Row(
        children: rowChildren,
      ));
    }
    return wrappedList;
  }
}
