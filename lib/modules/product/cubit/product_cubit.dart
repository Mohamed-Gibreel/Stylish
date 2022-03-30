import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/modules/product/model/product_model.dart';
import 'package:uuid/uuid.dart';

part './product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(LoadingProducts()) {
    Future.delayed(const Duration(seconds: 3), getAllProducts);
  }

  void getAllProducts() {
    emit(
      LoadedProducts([
        Product(
          uid: const Uuid().v4(),
          name: 'Curved Hem Shirt',
          price: 1165,
          bgColor: 'EDFDF4',
          image: 'assets/products/shirt-1.png',
          bgOpacity: .15,
          description: 'description',
          colors: const ['8E8F86', 'DDFEF9'],
        ),
        Product(
          uid: const Uuid().v4(),
          image: 'assets/products/shirt-6.png',
          price: 165,
          name: 'Casual Henley Shirt',
          bgColor: 'EFEFF2',
          description: 'description',
          colors: const [],
          bgOpacity: .5,
        ),
        Product(
          uid: const Uuid().v4(),
          image: 'assets/products/shirt-4.png',
          price: 165,
          name: 'Curved Hem Shirt',
          bgColor: 'EDFDF4',
          bgOpacity: .4,
          description: 'description',
          colors: const [],
        ),
        Product(
          uid: const Uuid().v4(),
          image: 'assets/products/shirt-3.png',
          price: 165,
          name: 'Curved Hem Shirt',
          bgColor: '8E8F86',
          bgOpacity: .15,
          description: 'description',
          colors: const [],
        ),
        Product(
          uid: const Uuid().v4(),
          image: 'assets/products/shirt-1.png',
          price: 165,
          name: 'Curved Hem Shirt',
          bgColor: 'EFEFF2',
          bgOpacity: .15,
          colors: const [],
          description: 'description',
        ),
        Product(
          uid: const Uuid().v4(),
          image: 'assets/products/shirt-2.png',
          price: 165,
          name: 'Casual Nolin',
          bgColor: 'DDFEF9',
          bgOpacity: .29,
          description: 'description',
          colors: const [],
        ),
      ]),
    );
  }
}
