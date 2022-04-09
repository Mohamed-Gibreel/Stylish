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
  RemovedCartItem(this.product);
  final CartItemModel product;
  @override
  List<Object?> get props => [product];
}

class IncrementedQuantityItem extends CartState {
  IncrementedQuantityItem(this.product);
  final CartItemModel product;
  @override
  List<Object?> get props => [product];
}

class DecrementedQuantityItem extends CartState {
  DecrementedQuantityItem(this.product);
  final CartItemModel product;
  @override
  List<Object?> get props => [product];
}

class ClearedClart extends CartState {
  @override
  List<Object?> get props => [];
}
