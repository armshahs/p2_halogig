class UniformModel {
  UniformModel({
    required this.type,
    required this.size,
    required this.price,
  });

  final String type;
  final String size;
  final String price;

  factory UniformModel.fromJson(Map<String, dynamic> json) {
    return UniformModel(
      type: json['type'] ?? '',
      size: json['size'] ?? '',
      price: json['price'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'size': size,
      'price': price,
    };
  }
}
