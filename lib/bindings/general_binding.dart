import 'package:get/get.dart';
import 'package:sore_app_with_firebase/core/utils/network/network_manager.dart';

class GeneralBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}
