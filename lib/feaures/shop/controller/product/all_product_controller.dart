import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:sore_app_with_firebase/data/repository/product/product_repo.dart';

import '../../../../core/common/widgets/loaders/t_loaders.dart';
import '../../models/prodcut/pruduct_model.dart';

class AllProductController extends GetxController {
  static AllProductController get instance => Get.find();

  final repo = ProductRepo.instance;
  RxList<ProductModel> products = <ProductModel>[].obs;
  Rx<String> sortOption = "Name".obs;

  void sortProducts(String sortOption) {
    this.sortOption.value = sortOption;
    switch (sortOption) {
      case "Name":
        products.sort((a, b) => a.title.compareTo(b.title));
        break;
      case "Higher Price":
        products.sort((a, b) => b.price.compareTo(a.price));
        break;
      case "Lower Price":
        products.sort((a, b) => a.price.compareTo(b.price));
        break;
      case "Sale":
        products.sort((a, b) {
          if (b.salePrice > 0) {
            return a.salePrice.compareTo(b.salePrice);
          } else if (b.salePrice > 0) {
            return 1;
          } else {
            return -1;
          }
        });
        break;

      case "Newest":
        products.sort((a, b) => a.date!.compareTo(b.date!));
        break;

      default:
        products.sort((a, b) => a.title.compareTo(b.title));
        break;
    }
  }

  void assginProducts(List<ProductModel> productsList) {
    products.assignAll(productsList);
    sortProducts("Name");
  }

  fetchProductsByQuery(Query query) async {
    try {
      final productsList = await repo.getProductsByQuery(query);
      return productsList;
    } catch (e) {
      TLoaders.errorSnackBar(
          title: "Oh Sanp!", message: "Failed to fetch products.$e");
      return [];
    }
  }
}
