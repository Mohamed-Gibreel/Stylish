import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/modules/product/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155.w,
      height: 190.h,
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      margin: EdgeInsets.only(right: 7.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            height: 133.h,
            width: 142.w,
            decoration: BoxDecoration(
              color: Color(int.parse(product.bgColor, radix: 16))
                  .withOpacity(product.bgOpacity),
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Image.asset(product.image),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 98.w,
                  height: 36.h,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      product.name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
                Text(
                  r'$' + product.price.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
