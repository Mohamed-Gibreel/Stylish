import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/l10n/l10n.dart';
import 'package:stylish/modules/navigation/cubit/navigation_cubit.dart';
import 'package:stylish/modules/navigation/cubit/navigation_enum.dart';
import 'package:stylish/util/constants.dart';

class CompletedOrder extends StatelessWidget {
  const CompletedOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 208.w,
                height: 208.h,
                margin: EdgeInsets.only(bottom: 85.h),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border:
                      Border.all(width: 10.w, color: Constants.primaryColor),
                ),
                child: Center(
                  child: Container(
                    width: 80.w,
                    height: 80.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFFF67952).withOpacity(.1),
                    ),
                    child: Icon(
                      CupertinoIcons.checkmark_alt,
                      size: 36.sp,
                      color: Constants.primaryColor,
                    ),
                  ),
                ),
              ),
              Text(
                l10n.congratulation,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                l10n.completedOrderDesc,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: Colors.black.withOpacity(.5),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                height: 55.h,
                width: 233.w,
                margin: EdgeInsets.only(bottom: 10.h),
                decoration: BoxDecoration(
                  color: Constants.primaryColor,
                  borderRadius: BorderRadius.circular(55.r),
                ),
                clipBehavior: Clip.hardEdge,
                child: Material(
                  clipBehavior: Clip.hardEdge,
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      BlocProvider.of<NavigationCubit>(context)
                          .setNavBarItem(NavigationItem.home);
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        '/landingPage',
                        (route) => false,
                      );
                    },
                    child: Center(
                      child: Text(
                        l10n.getYourReceipt,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 55.h,
                width: 233.w,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFE9E2),
                  borderRadius: BorderRadius.circular(55.r),
                ),
                clipBehavior: Clip.hardEdge,
                child: Material(
                  color: Colors.transparent,
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    onTap: () {
                      BlocProvider.of<NavigationCubit>(context)
                          .setNavBarItem(NavigationItem.home);
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        '/landingPage',
                        (route) => false,
                      );
                    },
                    child: Center(
                      child: Text(
                        l10n.backToHome,
                        style: TextStyle(
                          color: const Color(0xFFF67952),
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
