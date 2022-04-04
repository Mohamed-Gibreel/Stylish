import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:stylish/modules/cart/cart.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(InitialCart());
  List<CartItemModel> cart = [];
  final GlobalKey<AnimatedListState> cartListKey = GlobalKey();
  int cartTotal = 0;

  void _findAndAnimateDifferences(
    List<CartItemModel> newCart, {
    List<CartItemModel> oldCart = const [],
  }) {
    _findIndexDifferences(newCart, oldCart).forEach((index) {
      cartListKey.currentState?.insertItem(index);
    });
    _findIndexDifferences(oldCart, newCart).reversed.forEach((index) {
      final cartItem = oldCart[index];
      cartListKey.currentState?.removeItem(
        index,
        (context, animation) => SizeTransition(
          sizeFactor: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutQuad,
          ),
          child: CartItem(cartItem: cartItem),
        ),
      );
    });
  }

  List<int> _findIndexDifferences(
    List<CartItemModel> a, [
    List<CartItemModel> b = const [],
  ]) {
    final difference = a.toSet().difference(b.toSet());
    return difference.map<int>((item) => a.indexOf(item)).toList();
  }

  void addProductToCart(CartItemModel cartItem) {
    cart.add(cartItem);
    cartTotal += cartItem.product.price;
    _findAndAnimateDifferences(cart);
    emit(AddedCartItem([...cart]));
  }

  void incrementQuantity(CartItemModel cartItem) {
    final foundProductIndex = cart.indexOf(cartItem);
    final newProduct = cart.elementAt(foundProductIndex).copyWith();
    newProduct.count = newProduct.quantity + 1;
    cart[foundProductIndex] = newProduct;
    cartTotal += cartItem.product.price;
    emit(IncrementedQuantityItem([...cart]));
  }

  void removeProductFromCart(CartItemModel cartItem) {
    final foundProduct = cart.indexOf(cartItem);
    cart.removeAt(foundProduct);
    emit(RemovedCartItem([...cart]));
  }

  void decrementQuantity(CartItemModel cartItem) {
    final foundProductIndex = cart.indexOf(cartItem);
    final newProduct = cart.elementAt(foundProductIndex).copyWith();
    newProduct.count = newProduct.quantity - 1;
    cart[foundProductIndex] = newProduct;
    if (newProduct.count < 1) {
      final oldCart = [...cart];
      cart.removeAt(foundProductIndex);
      _findAndAnimateDifferences(cart, oldCart: oldCart);
    }
    cartTotal -= cartItem.product.price;
    emit(DecrementedQuantityItem([...cart]));
  }
}
