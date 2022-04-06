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
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final _cartCubit = BlocProvider.of<CartCubit>(context, listen: true);
    return Padding(
      padding:
          EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h, bottom: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${_cartCubit.cart.length} Items in cart',
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 15.h,
          ),
          Expanded(
            child: AnimatedList(
              shrinkWrap: true,
              key: _cartCubit.cartListKey,
              initialItemCount: _cartCubit.cart.length,
              itemBuilder: (context, index, animation) =>
                  CartItem(cartItem: _cartCubit.cart[index]),
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
                      '\$${context.read<CartCubit>().cartTotal.toString()}',
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
                      color: _cartCubit.cart.isNotEmpty
                          ? Constants.primaryColor
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      clipBehavior: Clip.hardEdge,
                      borderRadius: BorderRadius.circular(10.r),
                      child: InkWell(
                        onTap: _cartCubit.cart.isNotEmpty
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
