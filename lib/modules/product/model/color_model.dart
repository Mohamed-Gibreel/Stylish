import 'dart:convert';

import 'package:flutter/foundation.dart';

@immutable
class ProductColor {
  const ProductColor({
    required this.color,
    required this.productImage,
  });

  factory ProductColor.fromJson(String source) =>
      ProductColor.fromMap(json.decode(source) as Map<String, dynamic>);

  factory ProductColor.fromMap(Map<String, dynamic> map) {
    return ProductColor(
      color: (map['color'] ?? '') as String,
      productImage: (map['productImage'] ?? '') as String,
    );
  }

  final String color;
  final String productImage;

  ProductColor copyWith({
    String? color,
    String? productImage,
  }) {
    return ProductColor(
      color: color ?? this.color,
      productImage: productImage ?? this.productImage,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, String>{}
      ..addAll({'color': color})
      ..addAll({'productImage': productImage});

    return result;
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'Color(color: $color, productImage: $productImage)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductColor &&
        other.color == color &&
        other.productImage == productImage;
  }

  @override
  int get hashCode => color.hashCode ^ productImage.hashCode;
}
