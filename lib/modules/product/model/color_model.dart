import 'dart:convert';

import 'package:flutter/foundation.dart';

@immutable
class Color {
  const Color({
    required this.color,
    required this.productImage,
  });

  factory Color.fromJson(String source) =>
      Color.fromMap(json.decode(source) as Map<String, String>);

  factory Color.fromMap(Map<String, String> map) {
    return Color(
      color: map['color'] ?? '',
      productImage: map['productImage'] ?? '',
    );
  }

  final String color;
  final String productImage;

  Color copyWith({
    String? color,
    String? productImage,
  }) {
    return Color(
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

    return other is Color &&
        other.color == color &&
        other.productImage == productImage;
  }

  @override
  int get hashCode => color.hashCode ^ productImage.hashCode;
}
