import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/modules/homepage/view/components/bottom_nav_bar_item.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // clipBehavior: Clip.hardEdge,
      height: 95.h,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(.1),
            blurRadius: 2,
          )
        ],
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          CustomBottomNavBarItem(
            icon: 'assets/homepage/profile.svg',
          ),
          CustomBottomNavBarItem(
            icon: 'assets/homepage/heart-bottom-nav-bar.svg',
          ),
          CustomBottomNavBarItem(
            icon: 'assets/homepage/buy.svg',
          ),
          CustomBottomNavBarItem(
            icon: 'assets/homepage/profile.svg',
          )
        ],
      ),
    );
  }
}
