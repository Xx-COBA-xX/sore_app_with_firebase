import 'package:cloud_firestore/cloud_firestore.dart';

class AdModel {
  final bool active;
  final String imageUrl;

  AdModel({required this.active, required this.imageUrl});

  static AdModel empty() => AdModel(active: false, imageUrl: '');

  Map<String, dynamic> toJson() {
    return {
      'active': active,
      'imageUrl': imageUrl,
    };
  }

  factory AdModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    if (snapshot.data() != null) {
      {
        final json = snapshot.data()!;
        return AdModel(
          active: json['isActive']  ?? false,
          imageUrl: json['imageUrl'] ?? "",
        );
      }
    } else {
      return AdModel.empty();
    }
  }
}
