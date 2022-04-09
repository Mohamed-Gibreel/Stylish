import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:stylish/modules/cart/cart.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(InitialCart());
  List<CartItemModel> cart = [];
  int cartTotal = 0;

  void addProductToCart(CartItemModel cartItem) {
    cart.add(cartItem);
    cartTotal += cartItem.product.price;
    emit(AddedCartItem([...cart]));
  }

  void incrementQuantity(CartItemModel cartItem) {
    final foundProductIndex = cart.indexOf(cartItem);
    final newProduct = cart.elementAt(foundProductIndex).copyWith();
    newProduct.count = newProduct.quantity + 1;
    cart[foundProductIndex] = newProduct;
    cartTotal += cartItem.product.price;
    emit(IncrementedQuantityItem(newProduct.copyWith()));
  }

  void removeProductFromCart(CartItemModel cartItem) {
    final foundProduct = cart.indexWhere(
      (item) =>
          item.product.uid == cartItem.product.uid &&
          cartItem.selectedColor == item.selectedColor,
    );
    cart.removeAt(foundProduct);
    cartTotal -= cartItem.product.price;
    emit(RemovedCartItem(cartItem));
  }

  void decrementQuantity(CartItemModel cartItem) {
    final foundProductIndex = cart.indexOf(cartItem);
    final newProduct = cart.elementAt(foundProductIndex).copyWith();
    newProduct.count = newProduct.quantity - 1;
    cart[foundProductIndex] = newProduct;
    if (newProduct.count < 1) {
      removeProductFromCart(cartItem);
      return;
    }
    cartTotal -= cartItem.product.price;
    emit(DecrementedQuantityItem(newProduct.copyWith()));
  }

  void clearCart() {
    cart.clear();
    cartTotal = 0;
    emit(ClearedClart());
  }
}
