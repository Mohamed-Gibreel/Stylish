import 'dart:convert';

import 'package:stylish/modules/product/product.dart';

class CartItemModel {
  CartItemModel({
    required this.product,
    required this.quantity,
  });

  factory CartItemModel.fromMap(Map<String, dynamic> map) {
    return CartItemModel(
      product: ProductModel.fromMap(map['product'] as Map<String, dynamic>),
      quantity: (map['quantity'] ?? 0) as int,
    );
  }

  factory CartItemModel.fromJson(String source) =>
      CartItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  ProductModel product;
  int quantity;

  set count(int quantity) {
    this.quantity = quantity;
  }

  int get count {
    return quantity;
  }

  CartItemModel copyWith({
    ProductModel? product,
    int? quantity,
  }) {
    return CartItemModel(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{
      'product': product.toMap(),
      'quantity': quantity
    };

    return result;
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'CartItemModel(product: $product, quantity: $quantity)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CartItemModel &&
        other.product == product &&
        other.quantity == quantity;
  }

  @override
  int get hashCode => product.hashCode ^ quantity.hashCode;
}
