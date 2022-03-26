// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomCreditCard extends StatelessWidget {
  const CustomCreditCard({Key? key, required this.cardHolderName})
      : super(key: key);
  final String cardHolderName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 275.w,
      height: 157.h,
      margin: EdgeInsets.only(right: 10.w),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Stack(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: 100.w,
                child: Container(
                  width: 100.w,
                  height: 100.h,
                  // clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFBACAD),
                    shape: BoxShape.circle,
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                    child: const SizedBox(),
                  ),
                ),
              ),
              Positioned(
                top: -50.h,
                left: -25.w,
                child: Container(
                  width: 159.w,
                  height: 159.h,
                  // clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF53F3F),
                    shape: BoxShape.circle,
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 1, sigmaY: 50),
                    child: const SizedBox(),
                  ),
                ),
              ),
              Positioned(
                // left: 0.w,
                bottom: -55.h,
                child: Container(
                  width: 150.w,
                  height: 150.h,
                  // clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFF4F17),
                    shape: BoxShape.circle,
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 3),
                    child: const SizedBox(),
                  ),
                ),
              ),
              Positioned(
                right: -45.w,
                top: -35.h,
                child: Container(
                  width: 144.w,
                  height: 144.h,
                  // clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    color: Colors.purple,
                    shape: BoxShape.circle,
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 65, sigmaY: 50),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Platinum Card',
                        style: TextStyle(
                          color: Colors.white,
                          // fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/wallet/visa.svg',
                        fit: BoxFit.fitHeight,
                        height: 35.h,
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    'assets/wallet/chip.svg',
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '123 579 4685',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Wrap(
                            children: const [
                              Text(
                                'Valid ',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '20/09/2023',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Flexible(
                            child: SizedBox(
                              width: 115.w,
                              child: Text(
                                cardHolderName,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.end,
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  // fontSize: 16.sp,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
