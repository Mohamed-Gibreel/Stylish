part of './product_cubit.dart';

abstract class ProductState extends Equatable {}

class LoadingProducts extends ProductState {
  @override
  List<Object> get props => [];
}

class LoadedProducts extends ProductState {
  LoadedProducts(this.products);
  final List<Product> products;
  @override
  List<Object> get props => [products];
}

class ErrorState extends ProductState {
  @override
  List<Object> get props => [];
}
