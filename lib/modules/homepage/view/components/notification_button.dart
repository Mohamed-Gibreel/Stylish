import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/util/constants.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w),
      child: Align(
        child: Container(
          width: 42.w,
          height: 38.h,
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.withOpacity(.1),
                blurRadius: 1,
              )
            ],
            borderRadius: BorderRadius.circular(5.r),
            color: Colors.white,
          ),
          child: Center(
            child: Stack(
              children: [
                const Icon(
                  Icons.notifications,
                  color: Colors.grey,
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    width: 10.w,
                    height: 10.h,
                    padding: EdgeInsets.symmetric(
                      horizontal: 2.w,
                      vertical: 2.h,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      constraints: BoxConstraints(
                        maxHeight: 1.h,
                        maxWidth: 1.w,
                      ),
                      decoration: const BoxDecoration(
                        color: Constants.primaryColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
