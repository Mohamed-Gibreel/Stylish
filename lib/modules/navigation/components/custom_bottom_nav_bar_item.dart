import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylish/util/constants.dart';

class CustomBottomNavBarItem extends StatelessWidget {
  const CustomBottomNavBarItem(
      {Key? key, required this.icon, required this.active})
      : super(key: key);
  final String icon;
  final bool active;

  BoxDecoration activeDecoration() {
    return BoxDecoration(
      boxShadow: const <BoxShadow>[
        BoxShadow(
          color: Constants.primaryColor,
          blurRadius: 5,
        )
      ],
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(50.r),
        bottomRight: Radius.circular(50.r),
      ),
      color: Constants.primaryColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 8.h,
          width: 13.w,
          margin: EdgeInsets.only(bottom: 18.h),
          // decoration: active ? activeDecoration() : null,
        ),
        SvgPicture.asset(icon),
      ],
    );
  }
}
