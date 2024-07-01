import 'package:cloud_firestore/cloud_firestore.dart';

class CategoriesModel {
  final String id;
  final String name;
  final String image;
  final String parentId;
  final bool isFeatured;

  CategoriesModel({
    this.id = "",
    required this.name,
    required this.image,
    required this.parentId,
    required this.isFeatured,
  });

  static CategoriesModel empty() =>
      CategoriesModel(name: "", image: "", parentId: "", isFeatured: false);

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "image": image,
      "parentId": parentId,
      "isFeatured": isFeatured,
    };
  }

  factory CategoriesModel.formSnapshot(DocumentSnapshot<Map<String , dynamic>> document){
    if(document.data() != null){
      final data = document.data();
      return CategoriesModel(
        id: document.id,
        name: data!['name'] ?? "",
        image: data['image']?? "",
        parentId: data['parentId']?? "",
        isFeatured: data['isFeatured']?? false,
      );
    }else{
      return CategoriesModel.empty();
    }
  }
}
