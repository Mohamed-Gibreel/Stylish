import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/modules/cart/cart.dart';
import 'package:stylish/modules/cart/model/cart_item_model.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key, required this.cartItem}) : super(key: key);
  final CartItemModel cartItem;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Container(
            height: 73.h,
            width: 84.w,
            margin: EdgeInsets.only(right: 19.w),
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 3.h,
            ),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(62, 66, 41, 0.1),
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Image.asset(cartItem.product.image),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  cartItem.product.name,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.black.withOpacity(.5),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$${cartItem.product.price}',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 22.h,
                          width: 26.w,
                          margin: EdgeInsets.only(right: 11.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: const Color.fromRGBO(246, 121, 82, 0.15),
                          ),
                          child: Material(
                            borderRadius: BorderRadius.circular(8.r),
                            clipBehavior: Clip.hardEdge,
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                BlocProvider.of<CartCubit>(context)
                                    .decrementQuantity(cartItem);
                              },
                              child: const Icon(
                                CupertinoIcons.minus,
                                size: 14,
                                color: Color(
                                  0xFFF67952,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          cartItem.quantity.toString(),
                        ),
                        Container(
                          height: 22.h,
                          width: 26.w,
                          margin: EdgeInsets.only(left: 11.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: const Color.fromRGBO(246, 121, 82, 0.15),
                          ),
                          child: Material(
                            borderRadius: BorderRadius.circular(8.r),
                            clipBehavior: Clip.hardEdge,
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                BlocProvider.of<CartCubit>(context)
                                    .incrementQuantity(cartItem);
                              },
                              child: const Icon(
                                Icons.add,
                                size: 14,
                                color: Color(
                                  0xFFF67952,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
