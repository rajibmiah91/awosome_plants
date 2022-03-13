import 'dart:convert';



class CartModel {
  String name;
  String des;
  String image;
  String price;
  int quantity;
  CartModel({
    required this.name,
    required this.des,
    required this.image,
    required this.price,
    required this.quantity,
  });
  

  CartModel copyWith({
    String? name,
    String? des,
    String? image,
    String? price,
    int? quantity,
  }) {
    return CartModel(
      name: name ?? this.name,
      des: des ?? this.des,
      image: image ?? this.image,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'name': name});
    result.addAll({'des': des});
    result.addAll({'image': image});
    result.addAll({'price': price});
    result.addAll({'quantity': quantity});
  
    return result;
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      name: map['name'] ?? '',
      des: map['des'] ?? '',
      image: map['image'] ?? '',
      price: map['price'] ?? '',
      quantity: map['quantity']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartModel.fromJson(String source) => CartModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CartModel(name: $name, des: $des, image: $image, price: $price, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CartModel &&
      other.name == name &&
      other.des == des &&
      other.image == image &&
      other.price == price &&
      other.quantity == quantity;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      des.hashCode ^
      image.hashCode ^
      price.hashCode ^
      quantity.hashCode;
  }
}
