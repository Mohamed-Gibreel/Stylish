part of 'cart_cubit.dart';

abstract class CartState extends Equatable {}

class InitialCart extends CartState {
  @override
  List<Object?> get props => [];
}

class AddedCartItem extends CartState {
  AddedCartItem(this.products);
  final List<CartItemModel> products;
  @override
  List<Object?> get props => [products];
}

class RemovedCartItem extends CartState {
  RemovedCartItem(this.products);
  final List<CartItemModel> products;
  @override
  List<Object?> get props => [products];
}

class IncrementedQuantityItem extends CartState {
  IncrementedQuantityItem(this.products);
  final List<CartItemModel> products;
  @override
  List<Object?> get props => [products];
}

class DecrementedQuantityItem extends CartState {
  DecrementedQuantityItem(this.products);
  final List<CartItemModel> products;
  @override
  List<Object?> get props => [products];
}
