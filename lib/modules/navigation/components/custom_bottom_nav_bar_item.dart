import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylish/modules/cart/cubit/cart_cubit.dart';
import 'package:stylish/modules/favourite/cubit/favourite_cubit.dart';
import 'package:stylish/util/constants.dart';

class CustomBottomNavBarItem extends StatefulWidget {
  const CustomBottomNavBarItem({
    Key? key,
    required this.icon,
    required this.type,
  }) : super(key: key);
  final String icon;
  final String type;

  @override
  State<CustomBottomNavBarItem> createState() => _CustomBottomNavBarItemState();
}

class _CustomBottomNavBarItemState extends State<CustomBottomNavBarItem> {
  Widget _navigationItem(String icon, String type) {
    int? indicatorValue;
    switch (type) {
      case 'favourite':
        indicatorValue = BlocProvider.of<FavouriteCubit>(context, listen: true)
            .favourites
            .length;
        break;
      case 'cart':
        indicatorValue =
            BlocProvider.of<CartCubit>(context, listen: true).cart.length;
        break;
    }
    return Column(
      children: [
        Container(
          height: 8.h,
          width: 13.w,
          margin: EdgeInsets.only(bottom: 18.h),
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            SvgPicture.asset(widget.icon),
            if (indicatorValue != null && indicatorValue > 0)
              Positioned(
                right: -15.h,
                top: -10.h,
                child: Center(
                  child: Container(
                    height: 15.h,
                    constraints: BoxConstraints(minWidth: 15.w),
                    decoration: BoxDecoration(
                      color: Constants.primaryColor,
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      (indicatorValue).toString(),
                      style: TextStyle(fontSize: 10.sp),
                    ),
                  ),
                ),
              )
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _navigationItem(widget.icon, widget.type);
  }
}
