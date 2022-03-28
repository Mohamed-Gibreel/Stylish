import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/l10n/l10n.dart';
import 'package:stylish/util/constants.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('1/3', style: TextStyle(fontSize: 16.sp)),
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
                  'assets/onboarding/onboarding-3.png',
                  width: 325.w,
                  height: 325.h,
                ),
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  l10n.chooseProduct,
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                SizedBox(
                  width: 323.w,
                  child: Text(
                    l10n.chooseProductDesc,
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
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/secondOnboarding');
                // Navigator.of(context).push(
                //   MaterialPageRoute<SecondOnboarding>(
                //     builder: (context) => const SecondOnboarding(),
                //   ),
                // );
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
                    Text(
                      l10n.next,
                      style: TextStyle(fontSize: 16.sp, color: Colors.white),
                    ),
                    const Icon(
                      Icons.chevron_right_rounded,
                      color: Colors.white,
                    )
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
