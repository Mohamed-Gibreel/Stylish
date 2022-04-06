part of './product_cubit.dart';

abstract class ProductState extends Equatable {}

class ProductInitialState extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductFetchInProgress extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductFetchCompleted extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductFetchError extends ProductState {
  @override
  List<Object> get props => [];
}
