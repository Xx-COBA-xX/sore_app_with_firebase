import 'package:get/get.dart';
import 'package:sore_app_with_firebase/core/common/widgets/loaders/t_loaders.dart';
import 'package:sore_app_with_firebase/data/repository/categories/categories_repository.dart';
import 'package:sore_app_with_firebase/data/repository/product/product_repo.dart';
import 'package:sore_app_with_firebase/feaures/shop/models/prodcut/pruduct_model.dart';

import '../../models/categories/categories_model.dart';

class CategoriesContorller extends GetxController {
  static CategoriesContorller get instance => Get.find();

  final Rx<bool> isLoading = false.obs;
  final RxList<CategoriesModel> allCategories = <CategoriesModel>[].obs;
  final RxList<CategoriesModel> featuerCategories = <CategoriesModel>[].obs;
  final CategoriesRepository categoriesRepository =
      Get.put(CategoriesRepository());
  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    try {
      isLoading.value = true;
      final categories = await categoriesRepository.getAllCategories();
      allCategories.assignAll(
          categories.where((element) => element.parentId.isEmpty).toList());
      featuerCategories.assignAll(categories
          .where((element) => element.isFeatured && element.parentId.isEmpty)
          .toList());
    } catch (e) {
      TLoaders.errorSnackBar(
          title: "Oh snap!",
          message: "There was an error fetching categories.${e.toString()}");
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<CategoriesModel>> fetchSupCategories(
      {required String categoryId}) async {
    try {
      final categories =
          await categoriesRepository.getSupCategories(categoryId);
      return categories;
    } catch (e) {
      TLoaders.errorSnackBar(
          title: "Oh snap!",
          message:
              "There was an error fetching sup categories.${e.toString()}");
      return [];
    }
  }

  Future<List<ProductModel>> fetchSupCategoryProduct(
      {required String categoryId, int limit = -1}) async {
    try {
      final products = await ProductRepo.instance
          .getProductsForCategory(categoryId: categoryId, limit: -1);
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(
          title: "Oh snap!",
          message:
              "There was an error fetching sup categories.${e.toString()}");
      return [];
    }
  }
}
