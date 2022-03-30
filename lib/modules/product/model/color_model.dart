import 'dart:convert';

import 'package:flutter/foundation.dart';

@immutable
class CustomColor {
  const CustomColor({
    required this.color,
    required this.productImage,
  });

  factory CustomColor.fromJson(String source) =>
      CustomColor.fromMap(json.decode(source) as Map<String, String>);

  factory CustomColor.fromMap(Map<String, String> map) {
    return CustomColor(
      color: map['color'] ?? '',
      productImage: map['productImage'] ?? '',
    );
  }

  final String color;
  final String productImage;

  CustomColor copyWith({
    String? color,
    String? productImage,
  }) {
    return CustomColor(
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

    return other is CustomColor &&
        other.color == color &&
        other.productImage == productImage;
  }

  @override
  int get hashCode => color.hashCode ^ productImage.hashCode;
}
