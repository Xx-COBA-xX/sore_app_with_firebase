import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instanse => Get.put(HomeController());

  final Rx<int> curentSilderIndex = 0.obs;

   void onUpdateSlider(int index) {
    curentSilderIndex.value = index;
  }
}
