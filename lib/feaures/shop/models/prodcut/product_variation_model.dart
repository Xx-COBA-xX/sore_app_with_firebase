class ProductVariationModel {
  final String id;
  String sku;
  String image;
  String? description;
  double price;
  double salePrice;
  int stock;
  Map<String, String> attributeValues;

  ProductVariationModel({
    required this.id,
    required this.attributeValues,
    this.sku = '',
    this.image = '',
    this.description = '',
    this.price = 0.0,
    this.salePrice = 0.0,
    this.stock = 0,
  });

  toJson() {
    return {
      'id': id,
      'sku': sku,
      'image': image,
      'description': description,
      'price': price,
      'salePrice': salePrice,
      'stock': stock,
      'attributeValues': attributeValues,
    };
  }

  static ProductVariationModel empty() => ProductVariationModel(
        id: '',
        attributeValues: {},
      );

  factory ProductVariationModel.fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) return ProductVariationModel.empty();
    return ProductVariationModel(
      attributeValues: Map<String, String>.from(json["attributeValues"]?? {}),
      id: json["id"] ?? "",
      sku: json["sku"] ?? "",
      image: json["image"] ?? "",
      description: json["description"] ?? "",
      price:json["price"] ?? 0.0,
      salePrice: json["salePrice"] ?? 0.0,
      stock: json["stock"] ?? 0,
    );
  }
}
