import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part './product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(const ProductState('product'));
}
