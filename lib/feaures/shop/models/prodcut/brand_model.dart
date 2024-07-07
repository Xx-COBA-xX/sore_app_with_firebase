class BrandModel {
  String id;
  String name;
  String image;
  int? productsCount;
  bool? isFeatured;
  BrandModel(
      {required this.id,
      required this.name,
      required this.image,
      this.productsCount,
      this.isFeatured = false});

  toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'productsCount': productsCount,
      'isFeatured': isFeatured,
    };
  }

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      productsCount: json['productsCount'] ?? 0,
      isFeatured: json['isFeatured'] ?? false,
    );
  }
}
