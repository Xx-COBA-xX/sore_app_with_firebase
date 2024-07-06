import 'package:get/get.dart';
import 'package:sore_app_with_firebase/core/common/widgets/loaders/t_loaders.dart';
import 'package:sore_app_with_firebase/core/utils/constants/enums.dart';

import '../../../../data/repository/product/product_repo.dart';
import '../../models/prodcut/pruduct_model.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final repo = Get.put(ProductRepo());
  RxList<ProductModel> products = <ProductModel>[].obs;
  Rx<bool> isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      isLoading.value = true;
      final productsList = await repo.getProducts();
      products.assignAll(productsList);
    } catch (e) {
      TLoaders.errorSnackBar(
          title: "Oh Sanp!", message: "Failed to fetch products.$e");
    } finally {
      isLoading.value = false;
    }
  }

  getProductsPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price)
          .toString();
    } else {
      for (var variation in product.productVariations!) {
        double priceToConsider =
            variation.salePrice > 0.0 ? variation.salePrice : variation.price;
        if (priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }
        if (priceToConsider > largestPrice) {
          largestPrice = priceToConsider;
        }
      }
    }
    if (smallestPrice.isEqual(largestPrice)) {
      return largestPrice.toString();
    } else {
      return "$smallestPrice - $largestPrice";
    }
  }

  String? calculateSalePercent(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice == 0.0) {
      return null;
    }
    if (originalPrice <= 0) return null;

    double percent = ((originalPrice - salePrice) / originalPrice) * 100;
    if(percent < 0) percent = percent * -1;
    return percent.toStringAsFixed(0);
  }

  String getProductStockStatus(int stock) {
    return stock > 0 ? "In Stock" : "Out of Stock";
    
  }
}
