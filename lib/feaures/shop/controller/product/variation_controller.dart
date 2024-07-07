import 'package:get/get.dart';
import 'package:sore_app_with_firebase/feaures/shop/controller/product/image_controller.dart';
import 'package:sore_app_with_firebase/feaures/shop/models/prodcut/product_variation_model.dart';
import 'package:sore_app_with_firebase/feaures/shop/models/prodcut/pruduct_model.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = "".obs;
  Rx<ProductVariationModel> selectedVariation =
      ProductVariationModel.empty().obs;

  Set<String?> getAttributesAvailabilityVariation(
      List<ProductVariationModel> variations, String attributeName) {
    final availableVariationAttributes = variations
        .where((variation) =>
            variation.attributeValues[attributeName] != null &&
            variation.attributeValues[attributeName]!.isNotEmpty &&
            variation.stock > 0)
        //Fetch all non-empty attributes of variations
        .map((variation) => variation.attributeValues[attributeName])
        .toSet();
    return availableVariationAttributes;
  }

  void getProductVariationStockStatus() {
    variationStockStatus.value =
        selectedVariation.value.stock > 0 ? "In Stock" : "Out of Stock";
  }

  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }

  void onAttributeSelected(
      ProductModel product, String attributeName, String attributevalue) {
    final selectedAttributes =
        Map<String, dynamic>.from(this.selectedAttributes);
    selectedAttributes[attributeName] = attributevalue;
    this.selectedAttributes[attributeName] = attributevalue;

    final selectedVaration = product.productVariations!.firstWhere(
        (variation) => _isSameAttributeValues(
            variation.attributeValues, selectedAttributes),
        orElse: () => ProductVariationModel.empty());

    if (selectedVaration.image.isNotEmpty) {
      ImageController.instance.selectImage.value = selectedVaration.image;
    }

    selectedVariation.value = selectedVaration;
    getProductVariationStockStatus();
  }

  getVariationPrice() {
    return (selectedVariation.value.salePrice > 0
            ? selectedVariation.value.salePrice
            : selectedVariation.value.price)
        .toString();
  }

  bool _isSameAttributeValues(Map<String, dynamic> variationAttribute,
      Map<String, dynamic> selectedAttributes) {
    // Debugging prints
    if (variationAttribute.length != selectedAttributes.length) {
      return false;
    }

    for (final key in variationAttribute.keys) {
      // Debugging print
      if (variationAttribute[key] != selectedAttributes[key]) {
        return false;
      }
    }

    return true;
  }
}
