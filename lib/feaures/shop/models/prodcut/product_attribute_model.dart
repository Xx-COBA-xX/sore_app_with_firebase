class ProductAttributeModel {
  String? name;
  List<String>? value;

  ProductAttributeModel({
    this.name,
    this.value,
  });

  toJson() {
    return {
      'name': name,
      'value': value,
    };
  }

  static ProductAttributeModel empty() =>
      ProductAttributeModel(name: '', value: []);

  factory ProductAttributeModel.fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) return ProductAttributeModel.empty();
    return ProductAttributeModel(
      name: json.containsKey("name") ? json["name"] : "",
      value: List<String>.from(json["value"]),
    );
  }
}
