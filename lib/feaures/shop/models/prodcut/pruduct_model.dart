
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sore_app_with_firebase/feaures/shop/models/prodcut/brand_model.dart';

import 'product_attribute_model.dart';
import 'product_variation_model.dart';

class ProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;

  ProductModel({
    required this.id, //
    required this.stock, //
    this.sku,
    required this.price, //
    required this.title, //
    this.date,
    this.salePrice = 0.0,
    required this.thumbnail, //
    this.isFeatured,
    this.brand,
    this.description,
    this.categoryId,
    this.images,
    required this.productType, //
    this.productAttributes,
    this.productVariations,
  });

  toJson() {
    return {
      'id': id,
      'stock': stock,
      'sku': sku,
      'price': price,
      'title': title,
      'date': date,
      'salePrice': salePrice,
      'thumbnail': thumbnail,
      'isFeatured': isFeatured,
      'brand': brand?.toJson(),
      'description': description,
      'categoryId': categoryId,
      'images': images ?? [],
      'productType': productType,
      'productAttributes': productAttributes != null
          ? productAttributes?.map((e) => e.toJson()).toList()
          : [],
      'productVariations': productVariations != null
          ? productVariations?.map((e) => e.toJson()).toList()
          : [],
    };
  }

  static ProductModel empty() => ProductModel(
        id: '',
        stock: 0,
        price: 0.0,
        title: '',
        thumbnail: '',
        productType: '',
      );

  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    if (data == null) return ProductModel.empty();
    return ProductModel(
      id: document.id,
      stock: data['stock'] ?? 0,
      sku: data['sku'] ?? '',
      price: data['price']?? 0.0,
      title: data['title'] ?? '',
      date: (data['date'] ?? DateTime.now()),
      salePrice: data['salePrice'] ?? 0.0,
      thumbnail: data['thumbnail'] ?? '',
      isFeatured: data['isFeatured'] ?? false,
      brand: BrandModel.fromJson(data['brand']),
      description: data['description'] ?? '',
      categoryId: data['categoryId'] ?? '',
      images: data["images"] != null ? List<String>.from(data["images"]) : [],
      productType: data['productType'] ?? '',
      productAttributes: (data['productAttributes'] as List<dynamic>)
          .map((e) => ProductAttributeModel.fromJson(e))
          .toList(),
      productVariations: (data['productVariations'] as List<dynamic>)
          .map((e) => ProductVariationModel.fromJson(e))
          .toList(),
    );
  }

  factory ProductModel.fromQuerySnapshot(
      QueryDocumentSnapshot<Object> document) {
    final data = document.data() as Map<String, dynamic>;
    return ProductModel(
      id: document.id,
      stock: data['stock'] ?? 0,
      sku: data['sku'] ?? '',
      price: double.parse((data['price'] ?? 0.0).toString()),
      title: data['title'] ?? '',
      date: (data['date'] as Timestamp).toDate(),
      salePrice: double.parse((data['salePrice'] ?? 0.0).toString()),
      thumbnail: data['thumbnail'] ?? '',
      isFeatured: data['isFeatured'] ?? false,
      brand: BrandModel.fromJson(data['brand']),
      description: data['description'] ?? '',
      categoryId: data['categoryId'] ?? '',
      images: data["images"] != null ? List<String>.from(data["images"]) : [],
      productType: data['productType'] ?? '',
      productAttributes: (data['productAttributes'] as List<dynamic>)
          .map((e) => ProductAttributeModel.fromJson(e))
          .toList(),
      productVariations: (data['productVariations'] as List<dynamic>)
          .map((e) => ProductVariationModel.fromJson(e))
          .toList(),
    );
  }
}
