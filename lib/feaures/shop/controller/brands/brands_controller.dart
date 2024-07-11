import 'package:get/get.dart';
import 'package:sore_app_with_firebase/data/repository/brands/brands_repo.dart';
import 'package:sore_app_with_firebase/data/repository/product/product_repo.dart';
import 'package:sore_app_with_firebase/feaures/shop/models/prodcut/pruduct_model.dart';

import '../../models/brands/brands_model.dart';

class BrandsContorller extends GetxController {
  static BrandsContorller get instance => Get.find();

  final RxList<BrandsModel> allBrands = <BrandsModel>[].obs;
  final RxList<BrandsModel> featuredBrands = <BrandsModel>[].obs;
  final Rx<bool> isLoading = false.obs;
  final repo = Get.put(BrandsRepo());
  @override
  void onInit() {
    super.onInit();
    fetchAllBrands();
  }

  Future<void> fetchAllBrands() async {
    try {
      isLoading.value = true;
      final brands = await repo.getBrands();
      allBrands.assignAll(brands);
      featuredBrands.assignAll(
          allBrands.where((element) => element.isFeatured ?? false).take(4));
    } catch (e) {
      throw Exception(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<BrandsModel>> fetchBrandForCategory(String categoryId) async {
    try {
      final brands = await repo.getBrandsForCategory(categoryId);
     
      return brands;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<ProductModel>> fetchBrandForProduct(
      {required String brandId, required int limit}) async {
    try {
      final products = await ProductRepo.instance
          .getBrandProducts(brandId: brandId, limit: limit);
      return products;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
