import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/modules/product/model/product_model.dart';
import 'package:uuid/uuid.dart';

part './product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(const ProductState([])) {
    getAllProducts();
  }

  void getAllProducts() {
    emit(
      ProductState([
        Product(
          uid: const Uuid().v4(),
          name: 'Curved Hem Shirt',
          price: 1165,
          bgColor: 'EDFDF4',
          image: 'assets/products/shirt-1.png',
          bgOpacity: .15,
          description: 'description',
          colors: [],
        ),
        Product(
          uid: const Uuid().v4(),
          image: 'assets/products/shirt-6.png',
          price: 165,
          name: 'Casual Henley Shirt',
          bgColor: 'EFEFF2',
          description: 'description',
          colors: [],
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
          colors: [],
        ),
        Product(
          uid: const Uuid().v4(),
          image: 'assets/products/shirt-3.png',
          price: 165,
          name: 'Curved Hem Shirt',
          bgColor: '8E8F86',
          bgOpacity: .15,
          description: 'description',
          colors: [],
        ),
        Product(
          uid: const Uuid().v4(),
          image: 'assets/products/shirt-1.png',
          price: 165,
          name: 'Curved Hem Shirt',
          bgColor: 'EFEFF2',
          bgOpacity: .15,
          colors: [],
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
          colors: [],
        ),
      ]),
    );
  }
}
