import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' as ui;

import 'package:stylish/modules/product/model/color_model.dart';

@immutable
class Product {
  const Product({
    required this.uid,
    required this.name,
    required this.price,
    required this.bgColor,
    required this.image,
    required this.bgOpacity,
    required this.description,
    required this.colors,
  });

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  factory Product.fromMap(Map<String, dynamic> map) {
    try {
      ui.Color(int.parse(map['bgColor'] as String, radix: 16));
    } catch (e) {
      map['bgColor'] = 'EFEFF2';
    }
    final validatedColors = <String>[];
    for (var color in map['colors'] as List<String>) {
      try {
        ui.Color(int.parse(map['bgColor'] as String, radix: 16));
        validatedColors.add(color);
      } catch (e) {
        color = '8E8F86';
      }
    }
    return Product(
        uid: map['uid'] as String,
        name: map['name'] as String,
        price: map['price'] as int,
        image: map['image'] as String,
        bgColor: map['bgColor'] as String,
        bgOpacity: map['bgOpacity'] as double,
        description: map['description'] as String,
        colors: validatedColors
        // colors: List<Color>.from(
        //   (map['colors'] as List<dynamic>).map<Color>(
        //     (dynamic x) => Color.fromJson(x as String),
        //   ),
        // ),
        );
  }

  final String uid;
  final String name;
  final int price;
  final String bgColor;
  final String image;
  final double bgOpacity;
  final String description;
  // final List<Color> colors;
  final List<String> colors;

  Product copyWith({
    String? uid,
    String? name,
    String? image,
    int? price,
    String? bgColor,
    double? bgOpacity,
    String? description,
    // List<Color>? colors,
    List<String>? colors,
  }) {
    return Product(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
      bgColor: bgColor ?? this.bgColor,
      bgOpacity: bgOpacity ?? this.bgOpacity,
      description: description ?? this.description,
      colors: colors ?? this.colors,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{}
      ..addAll(<String, dynamic>{'name': name})
      ..addAll(<String, dynamic>{'price': price})
      ..addAll(<String, dynamic>{'image': image})
      ..addAll(<String, dynamic>{'bgColor': bgColor})
      ..addAll(<String, dynamic>{'bgOpacity': bgOpacity})
      ..addAll(<String, dynamic>{'description': description})
      ..addAll(
        <String, dynamic>{'colors': colors.map((x) => x.toString()).toList()},
      );

    return result;
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Product(name: $name, price: $price, bgColor: $bgColor, bgOpacity: $bgOpacity, description: $description, colors: $colors, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.name == name &&
        other.price == price &&
        other.image == image &&
        other.bgColor == bgColor &&
        other.bgOpacity == bgOpacity &&
        other.description == description &&
        listEquals(other.colors, colors);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        price.hashCode ^
        bgColor.hashCode ^
        image.hashCode ^
        bgOpacity.hashCode ^
        description.hashCode ^
        colors.hashCode;
  }
}
