import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/l10n/l10n.dart';
import 'package:stylish/modules/cart/cart.dart';
import 'package:stylish/util/constants.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  GlobalKey<AnimatedListState> cartListKey = GlobalKey();
  final List<CartItemModel> _cart = [];

  @override
  void initState() {
    loadCart();
    super.initState();
  }

  void loadCart() {
    BlocProvider.of<CartCubit>(context, listen: false).cart.forEach((element) {
      final index = BlocProvider.of<CartCubit>(context, listen: false)
          .cart
          .indexOf(element);
      _cart.add(element);
      cartListKey.currentState?.insertItem(index);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding:
          EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h, bottom: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${context.watch<CartCubit>().cart.length} Items in cart',
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 15.h,
          ),
          Expanded(
            child: BlocConsumer<CartCubit, CartState>(
              listener: (context, state) {
                if (state is RemovedCartItem) {
                  final removedItem = state.product;
                  final indexOfItem = _cart.indexWhere(
                    (item) =>
                        item.product.uid == removedItem.product.uid &&
                        removedItem.selectedColor == item.selectedColor,
                  );
                  _cart.removeAt(indexOfItem);
                  cartListKey.currentState?.removeItem(
                    indexOfItem,
                    (context, animation) => SizeTransition(
                      sizeFactor: animation,
                      child: CartItem(cartItem: removedItem),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return AnimatedList(
                  shrinkWrap: true,
                  key: cartListKey,
                  initialItemCount: _cart.length,
                  itemBuilder: (context, index, animation) => SizeTransition(
                    sizeFactor: animation,
                    child: CartItem(
                      cartItem: _cart[index],
                    ),
                  ),
                );
              },
              // child:
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10.h),
            height: 110.h,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${l10n.subTotal} :'),
                    Text(
                      '\$${context.watch<CartCubit>().cartTotal.toString()}',
                      // r'$250',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                      ),
                    ),
                  ],
                ),
                Center(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    height: 55.h,
                    decoration: BoxDecoration(
                      color: _cart.isNotEmpty
                          ? Constants.primaryColor
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      clipBehavior: Clip.hardEdge,
                      borderRadius: BorderRadius.circular(10.r),
                      child: InkWell(
                        onTap: _cart.isNotEmpty
                            ? () {
                                Navigator.of(context).pushNamed('/checkout');
                              }
                            : () {},
                        child: Center(
                          child: Text(
                            l10n.checkout,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
