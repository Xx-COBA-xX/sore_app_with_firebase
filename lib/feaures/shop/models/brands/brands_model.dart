import 'package:cloud_firestore/cloud_firestore.dart';

class BrandsModel {
  final String? id;
  final String name;
  final int productCount;
  final String imageUrl;
  final bool? isFeatured;

  BrandsModel(
      {this.id,
      required this.name,
      required this.productCount,
      required this.imageUrl,
      this.isFeatured});

  toJson() {
    return {
      "id": id,
      "name": name,
      "productCount": productCount,
      "imageUrl": imageUrl,
      "isFeatured": isFeatured
    };
  }

  static BrandsModel empty() =>
      BrandsModel(name: "", productCount: 0, imageUrl: '');
  factory BrandsModel.fromShapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {

    if (snapshot.data() == null) return BrandsModel.empty();
    
    final data = snapshot.data();
    return BrandsModel(
      name: data!["name"] ?? "",
      productCount: data["productCount"] ?? 0,
      imageUrl: data["imageUrl"] ?? '',
      id: data["id"] ?? "",
      isFeatured: data["isFeatured"] ?? false,
    );
  }
}
