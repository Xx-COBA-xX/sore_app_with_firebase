import 'package:get/get.dart';
import 'package:sore_app_with_firebase/core/common/widgets/loaders/t_loaders.dart';
import 'package:sore_app_with_firebase/data/repository/ads/ads_respositroy.dart';
import 'package:sore_app_with_firebase/feaures/shop/models/ads/ads_model.dart';

class AdsContorller extends GetxController {
  static AdsContorller get instance => Get.find();

  final Rx<int> curentSilderIndex = 0.obs;
  final RxList<AdModel> allAds = <AdModel>[].obs;
  final Rx<bool> isLoading = false.obs;
  void onUpdateSlider(int index) {
    curentSilderIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    fetchAllAds();
  }

  Future<void> fetchAllAds() async {
    try {
      isLoading.value = true;

      final repo = Get.put(AdsRepository());
      final adsList = await repo.getAllAds();
      allAds.assignAll(adsList);

    } catch (e) {
      TLoaders.errorSnackBar(
          title: "Oh snap!",
          message:
              "there is an error while fetching ads images${e..toString()}");
    } finally {
      isLoading.value = false;
    }
  }
}
