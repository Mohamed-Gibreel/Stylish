import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteCard extends StatelessWidget {
  const FavouriteCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290.h,
      width: 155.w,
      padding: EdgeInsets.fromLTRB(5.w, 5.h, 5.w, 0.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Container(
                width: 142.w,
                height: 133.h,
                margin: EdgeInsets.only(bottom: 7.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: const Color(0xFFFFFCFA),
                ),
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: Image.asset(
                  'assets/products/shirt-1.png',
                ),
              ),
              Positioned(
                right: 5.w,
                top: 5.h,
                child: Container(
                  height: 25.h,
                  width: 25.w,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    CupertinoIcons.heart,
                    size: 18,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
          const Text('Long Sleeve Shirts'),
          SizedBox(
            height: 7.h,
          ),
          const Text(
            r'$165',
            style: TextStyle(fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
