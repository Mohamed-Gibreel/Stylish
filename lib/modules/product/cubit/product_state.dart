part of './product_cubit.dart';

class ProductState extends Equatable {
  const ProductState(this.product);
  final String product;

  @override
  List<Object> get props => [product];
}
