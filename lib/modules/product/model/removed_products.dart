import 'dart:convert';

import 'package:stylish/modules/product/product.dart';

class RemovedProduct {
  RemovedProduct({
    required this.index,
    required this.product,
  });

  factory RemovedProduct.fromMap(Map<String, dynamic> map) {
    return RemovedProduct(
      index: (map['index'] ?? 0) as int,
      product: ProductModel.fromMap(map['product'] as Map<String, dynamic>),
    );
  }

  factory RemovedProduct.fromJson(String source) =>
      RemovedProduct.fromMap(json.decode(source) as Map<String, dynamic>);

  final int index;
  final ProductModel product;

  RemovedProduct copyWith({
    int? index,
    ProductModel? product,
  }) {
    return RemovedProduct(
      index: index ?? this.index,
      product: product ?? this.product,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{}
      ..addAll(<String, dynamic>{'index': index})
      ..addAll(<String, dynamic>{'product': product.toMap()});

    return result;
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'RemovedProduct(index: $index, product: $product)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RemovedProduct &&
        other.index == index &&
        other.product == product;
  }

  @override
  int get hashCode => index.hashCode ^ product.hashCode;
}
