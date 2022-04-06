import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/modules/landingpage/landingpage.dart';
import 'package:stylish/modules/product/model/removed_products.dart';
import 'package:stylish/modules/product/product.dart';
import 'package:uuid/uuid.dart';

part './product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductFetchInProgress()) {
    Future.delayed(const Duration(seconds: 5), getAllProducts);
  }

  List<ProductModel> products = [];
  List<RemovedProduct> removedProducts = [];
  final GlobalKey<AnimatedListState> productListKey = GlobalKey();

  void _findAndAnimateDifferences(
    List<ProductModel> newProducts, {
    List<ProductModel> oldProducts = const [],
  }) {
    _findIndexDifferences(newProducts, oldProducts).forEach((index) {
      productListKey.currentState?.insertItem(
        index,
        duration: const Duration(milliseconds: 200),
      );
    });
    _findIndexDifferences(oldProducts, newProducts).reversed.forEach((index) {
      final product = oldProducts[index];
      productListKey.currentState?.removeItem(
        index,
        (context, animation) => SizeTransition(
          axis: Axis.horizontal,
          sizeFactor: animation,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                '/productPage',
                arguments: product,
              );
            },
            child: Align(
              alignment: Alignment.centerLeft,
              child: ProductCard(product: product),
            ),
          ),
        ),
      );
    });
  }

  List<int> _findIndexDifferences(
    List<ProductModel> a, [
    List<ProductModel> b = const [],
  ]) {
    final difference = a.toSet().difference(b.toSet());
    return difference.map<int>((item) => a.indexOf(item)).toList();
  }

  Future<void> getAllProducts() async {
    try {
      emit(
        ProductFetchInProgress(),
      );
      // Reasoning behind this logic:
      // For the animated list to show the animation of products being inserted,
      // the products list needs to be empty first which is only true if I emit
      // ProductFetchCompleted state before adding to the product list.
      // Check BlocBuilder Widget in homepage.dart to understand what is going.
      emit(
        ProductFetchCompleted(),
      );
      await Future.delayed(const Duration(milliseconds: 100), () {});
      products = [
        ProductModel(
          uid: const Uuid().v4(),
          name: 'Basic Jeans',
          price: 1165,
          category: 'pants',
          bgColor: 'EFEFF2',
          image: 'assets/products/jeans-1.png',
          bgOpacity: .5,
          description: 'description',
          colors: const [
            ProductColor(
              color: '3d85c6',
              productImage: 'assets/products/jeans-1.png',
            ),
            ProductColor(
              color: '000000',
              productImage: 'assets/products/jeans-2.png',
            ),
          ],
        ),
        ProductModel(
          uid: const Uuid().v4(),
          name: 'Premium super skinny jeans with ripped detailing',
          price: 1165,
          bgColor: 'EFEFF2',
          category: 'pants',
          image: 'assets/products/jeans-3.png',
          bgOpacity: .5,
          description: 'description',
          colors: const [
            ProductColor(
              color: 'EFEFF2',
              productImage: 'assets/products/jeans-3.png',
            ),
            ProductColor(
              color: 'EFEFF2',
              productImage: 'assets/products/jeans-4.png',
            ),
          ],
        ),
        ProductModel(
          uid: const Uuid().v4(),
          name: 'Relaxed fit jeans with ripped detailing',
          price: 1165,
          bgColor: 'EFEFF2',
          category: 'pants',
          image: 'assets/products/jeans-5.png',
          bgOpacity: .5,
          description: 'description',
          colors: const [
            ProductColor(
              color: 'EFEFF2',
              productImage: 'assets/products/jeans-5.png',
            ),
            ProductColor(
              color: 'EFEFF2',
              productImage: 'assets/products/jeans-6.png',
            ),
          ],
        ),
        ProductModel(
          uid: const Uuid().v4(),
          image: 'assets/products/shirt-6.png',
          price: 165,
          category: 'shirt',
          name: 'Casual Henley Shirt',
          bgColor: 'EFEFF2',
          description: 'description',
          colors: const [],
          bgOpacity: .5,
        ),
        ProductModel(
          uid: const Uuid().v4(),
          image: 'assets/products/shirt-4.png',
          price: 165,
          category: 'shirt',
          name: 'Curved Hem Shirt',
          bgColor: 'EDFDF4',
          bgOpacity: .4,
          description: 'description',
          colors: const [],
        ),
        ProductModel(
          uid: const Uuid().v4(),
          image: 'assets/products/shirt-3.png',
          price: 165,
          name: 'Curved Hem Shirt',
          bgColor: '8E8F86',
          category: 'shirt',
          bgOpacity: .15,
          description: 'description',
          colors: const [],
        ),
        ProductModel(
          uid: const Uuid().v4(),
          image: 'assets/products/shirt-1.png',
          price: 165,
          name: 'Curved Hem Shirt',
          category: 'shirt',
          bgColor: 'EFEFF2',
          bgOpacity: .15,
          colors: const [],
          description: 'description',
        ),
        ProductModel(
          uid: const Uuid().v4(),
          image: 'assets/products/shirt-2.png',
          price: 165,
          name: 'Casual Nolin',
          category: 'shirt',
          bgColor: 'DDFEF9',
          bgOpacity: .29,
          description: 'description',
          colors: const [],
        ),
      ];
      _findAndAnimateDifferences(products);
    } catch (e) {
      emit(ProductFetchError());
    }
  }

  void filterProducts(String type) {
    removeFilter();
    final productsToRemove = <RemovedProduct>[];
    final productsToRemoveWithoutIndex = <ProductModel>[];
    for (final product in products) {
      if (product.category != type) {
        removedProducts.add(
          RemovedProduct(
            index: products.indexOf(product),
            product: product,
          ),
        );
        productsToRemove.add(
          RemovedProduct(
            index: products.indexOf(product),
            product: product,
          ),
        );
        productsToRemoveWithoutIndex.add(product);
      }
    }
    final oldList = [...products];
    products.removeWhere(
      productsToRemoveWithoutIndex.contains,
    );
    _findAndAnimateDifferences(products, oldProducts: oldList);
  }

  void removeFilter() {
    final newList = [...products];
    for (final removedProduct in removedProducts) {
      newList.insert(removedProduct.index, removedProduct.product);
    }
    removedProducts.clear();
    _findAndAnimateDifferences(newList, oldProducts: products);
    products = [...newList];
  }
}
