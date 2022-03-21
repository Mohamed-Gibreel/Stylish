import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/l10n/l10n.dart';
import 'package:stylish/modules/cart/cart.dart';
import 'package:stylish/util/constants.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding:
          EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h, bottom: 105.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '10 Items in cart',
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 15.h,
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: const [
                CartItem(),
                CartItem(),
                CartItem(),
                CartItem(),
                CartItem(),
                CartItem(),
              ],
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
                      r'$250',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/checkout');
                  },
                  child: Center(
                    child: Container(
                      // width: 250.w,
                      height: 55.h,
                      decoration: BoxDecoration(
                        color: Constants.primaryColor,
                        borderRadius: BorderRadius.circular(50.r),
                      ),
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
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
