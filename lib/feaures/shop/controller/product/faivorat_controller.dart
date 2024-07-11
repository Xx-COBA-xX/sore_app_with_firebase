import 'dart:convert';

import 'package:get/get.dart';
import 'package:sore_app_with_firebase/core/common/widgets/loaders/t_loaders.dart';
import 'package:sore_app_with_firebase/data/repository/product/product_repo.dart';
import 'package:sore_app_with_firebase/feaures/shop/models/prodcut/pruduct_model.dart';

import '../../../../core/utils/local_storage/local_storage.dart';

class FavoriteController extends GetxController {
  static FavoriteController get instance => Get.find();

  final favorites = <String, bool>{}.obs;
  @override
  void onInit() {
    super.onInit();
    initFavorites();
  }

  void initFavorites() {
    final json = TLocalStorage.instance().readData('favorites');
    if (json != null) {
      final data = jsonDecode(json) as Map<String, dynamic>;
      favorites
          .assignAll(data.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavorite(String productId) {
    return favorites[productId] ?? false;
  }

  void toggleFavorite(String productId) {
    if (!favorites.containsKey(productId)) {
      favorites[productId] = true;
      saveFavoritesToStorage();
      TLoaders.customToast(message: 'Product has been added to favorites');
    } else {
      favorites.remove(productId);
      saveFavoritesToStorage();
      favorites.refresh();
      TLoaders.customToast(message: 'Product has been removed from favorites');
    }
  }

  void saveFavoritesToStorage() {
    final value = json.encode(favorites);
    TLocalStorage.instance().saveData("favorites", value);
  }

  Future<List<ProductModel>> fetchFavoriteProducts() {
    try {
      final products = ProductRepo.instance
          .getFavoriteProducts(productsIds: favorites.keys.toList());
      return products;
    } catch (e) {
      throw Exception("Fetch favorite products failed $e");
    }
  }
}
