class CartItem {
  CartItem({
    required this.productName,
    required this.price,
    required this.count,
    required this.id,
  });

  final String productName;
  final String price;
  String count;
  final String id;

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      productName: json['productName'] ?? '',
      price: json['price'] ?? '',
      count: json['count'] ?? '',
      id: json['id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productName': productName,
      'price': price,
      'count': count,
      'id': id,
    };
  }
}
