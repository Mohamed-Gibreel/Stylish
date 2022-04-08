import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  Future<void> getAllProducts() async {
    try {
      emit(
        ProductFetchInProgress(),
      );
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
              color: '000000',
              productImage: 'assets/products/jeans-3.png',
            ),
            ProductColor(
              color: '3d85c6',
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
              color: '000000',
              productImage: 'assets/products/jeans-5.png',
            ),
            ProductColor(
              color: '3d85c6',
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
      emit(
        ProductFetchCompleted(products),
      );
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
    products.removeWhere(
      productsToRemoveWithoutIndex.contains,
    );
    emit(
      ProductFetchCompleted(products),
    );
  }

  void removeFilter() {
    final newList = [...products];
    for (final removedProduct in removedProducts) {
      newList.insert(removedProduct.index, removedProduct.product);
    }
    removedProducts.clear();
    products = [...newList];
    emit(ProductFetchCompleted(products));
  }
}
