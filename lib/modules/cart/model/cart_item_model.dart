import 'dart:convert';

import 'package:stylish/modules/product/product.dart';

class CartItemModel {
  CartItemModel({
    required this.product,
    required this.quantity,
    required this.selectedColor,
  });

  factory CartItemModel.fromMap(Map<String, dynamic> map) {
    return CartItemModel(
      product: ProductModel.fromMap(map['product'] as Map<String, dynamic>),
      quantity: (map['quantity'] ?? 0) as int,
      selectedColor:
          ProductColor.fromMap(map['selectedColor'] as Map<String, dynamic>),
    );
  }

  factory CartItemModel.fromJson(String source) =>
      CartItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  ProductModel product;
  int quantity;
  ProductColor selectedColor;

  set count(int quantity) {
    this.quantity = quantity;
  }

  int get count {
    return quantity;
  }

  CartItemModel copyWith({
    ProductModel? product,
    int? quantity,
    ProductColor? selectedColor,
  }) {
    return CartItemModel(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      selectedColor: selectedColor ?? this.selectedColor,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{
      'product': product.toMap(),
      'quantity': quantity,
      'selectedColor': selectedColor.toMap()
    };

    return result;
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'CartItemModel(product: $product, quantity: $quantity, selectedColor: $selectedColor)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CartItemModel &&
        other.product == product &&
        other.quantity == quantity &&
        other.selectedColor == selectedColor;
  }

  @override
  int get hashCode =>
      product.hashCode ^ quantity.hashCode ^ selectedColor.hashCode;
}
