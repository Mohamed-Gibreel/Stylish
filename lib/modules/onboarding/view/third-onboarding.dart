import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/l10n/l10n.dart';
import 'package:stylish/util/constants.dart';

class ThirdOnboarding extends StatelessWidget {
  const ThirdOnboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('3/3', style: TextStyle(fontSize: 16.sp)),
                  Text(
                    l10n.skip,
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 55.h,
                ),
                Image.asset(
                  'assets/onboarding/onboarding-1.png',
                  width: 325.w,
                  height: 325.h,
                ),
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  l10n.getYourOrder,
                  style:
                      TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 16.h,
                ),
                SizedBox(
                  width: 323.w,
                  child: Text(
                    l10n.getYourOrderDesc,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.sp,
                      height: 1.3.sp,
                      color: Colors.black.withOpacity(.5),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  height: 35.h,
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                // Navigator.of(context).pushNamedAndRemoveUntil(
                Navigator.of(context).pushNamed(
                  '/login',
                  // (Route<dynamic> route) => false,
                );
              },
              child: Container(
                width: 218.w,
                height: 59.h,
                decoration: BoxDecoration(
                  color: Constants.primaryColor,
                  borderRadius: BorderRadius.circular(133.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 3.h),
                      child: Text(
                        l10n.getStarted,
                        style: TextStyle(fontSize: 16.sp, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                      child: Icon(
                        Icons.chevron_right_rounded,
                        color: Colors.white.withOpacity(.5),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                      child: Icon(
                        Icons.chevron_right_rounded,
                        color: Colors.white.withOpacity(.5),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                      child: const Icon(
                        Icons.chevron_right_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
