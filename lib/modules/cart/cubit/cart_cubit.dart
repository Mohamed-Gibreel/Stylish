import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stylish/modules/cart/model/cart_item_model.dart';

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
      cart.removeAt(foundProductIndex);
    }
    cartTotal -= cartItem.product.price;
    emit(DecrementedQuantityItem([...cart]));
  }
}
