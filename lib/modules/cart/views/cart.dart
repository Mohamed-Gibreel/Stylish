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
    // final _cartCubit = context.read<CartCubit>();
    final _cartCubit = BlocProvider.of<CartCubit>(context, listen: true);
    return Padding(
      padding:
          EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h, bottom: 105.h),
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
            child: _cartCubit.cart.isNotEmpty
                ? ListView(
                    shrinkWrap: true,
                    children: _cartCubit.cart
                        .map((e) => CartItem(cartItem: e))
                        .toList(),
                  )
                : const Center(
                    child: Text('No items in cart'),
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
                      context.read<CartCubit>().cartTotal.toString(),
                      // r'$250',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    height: 55.h,
                    decoration: BoxDecoration(
                      color: Constants.primaryColor,
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      clipBehavior: Clip.hardEdge,
                      borderRadius: BorderRadius.circular(50.r),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('/checkout');
                        },
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
