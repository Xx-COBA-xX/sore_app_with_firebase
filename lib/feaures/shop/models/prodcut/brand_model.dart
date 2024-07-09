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
});

  toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'productsCount': productsCount,

    };
  }

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      productsCount: json['productsCount'] ?? 0,

    );
  }
}
