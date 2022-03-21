import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/l10n/l10n.dart';
import 'package:stylish/modules/navigation/cubit/navigation_cubit.dart';
import 'package:stylish/modules/onboarding/view/third-onboarding.dart';
import 'package:stylish/util/constants.dart';

class SecondOnboarding extends StatefulWidget {
  const SecondOnboarding({Key? key}) : super(key: key);

  @override
  State<SecondOnboarding> createState() => _SecondOnboardingState();
}

class _SecondOnboardingState extends State<SecondOnboarding> {
  @override
  void dispose() {
    // BlocProvider.of<NavigationCubit>(context).close();
    super.dispose();
  }

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
                  Text('2/3', style: TextStyle(fontSize: 16.sp)),
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
                  'assets/onboarding/onboarding-2.png',
                  width: 325.w,
                  height: 325.h,
                ),
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  l10n.makePayment,
                  style:
                      TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 16.h,
                ),
                SizedBox(
                  width: 323.w,
                  child: Text(
                    l10n.makePaymentDesc,
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
                Navigator.of(context).pushNamed('/thirdOnboarding');
                // Navigator.of(context).push(
                //   MaterialPageRoute<ThirdOnboarding>(
                //     builder: (context) => const ThirdOnboarding(),
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
                    Icon(
                      Icons.chevron_right_rounded,
                      color: Colors.white.withOpacity(.5),
                    ),
                    const Icon(
                      Icons.chevron_right_rounded,
                      color: Colors.white,
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
