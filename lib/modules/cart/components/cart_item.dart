import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92.h,
      padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
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
                child: Image.asset('assets/products/shirt-1.png'),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Henley shirts',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black.withOpacity(.5),
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    r'$250',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
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
                child: const Icon(
                  CupertinoIcons.minus,
                  size: 14,
                  color: Color(
                    0xFFF67952,
                  ),
                ),
              ),
              const Text('1'),
              Container(
                height: 22.h,
                width: 26.w,
                margin: EdgeInsets.only(left: 11.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: const Color.fromRGBO(246, 121, 82, 0.15),
                ),
                child: const Icon(
                  Icons.add,
                  size: 14,
                  color: Color(
                    0xFFF67952,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
