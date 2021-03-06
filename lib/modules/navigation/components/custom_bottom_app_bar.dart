import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/modules/navigation/cubit/navigation_enum.dart';
import 'package:stylish/modules/navigation/navigation.dart';
import 'package:stylish/util/constants.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).padding.bottom == 0 ? 75.h : 85.h,
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
      child: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) => DefaultTabController(
          length: 4,
          child: Material(
            borderRadius: BorderRadius.circular(20.r),
            clipBehavior: Clip.hardEdge,
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Constants.primaryColor,
              onTap: (index) {
                switch (index) {
                  case 0:
                    context
                        .read<NavigationCubit>()
                        .setNavBarItem(NavigationItem.home);
                    break;
                  case 1:
                    context
                        .read<NavigationCubit>()
                        .setNavBarItem(NavigationItem.favourite);
                    break;
                  case 2:
                    context
                        .read<NavigationCubit>()
                        .setNavBarItem(NavigationItem.cart);
                    break;
                  case 3:
                    context
                        .read<NavigationCubit>()
                        .setNavBarItem(NavigationItem.profile);
                    break;
                }
              },
              indicator: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Constants.primaryColor,
                    width: 3.w,
                  ),
                ),
              ),
              tabs: const [
                CustomBottomNavBarItem(
                  icon: 'assets/homepage/profile.svg',
                  type: 'home',
                ),
                CustomBottomNavBarItem(
                  icon: 'assets/homepage/heart-bottom-nav-bar.svg',
                  type: 'favourite',
                ),
                CustomBottomNavBarItem(
                  icon: 'assets/homepage/buy.svg',
                  type: 'cart',
                ),
                CustomBottomNavBarItem(
                  icon: 'assets/homepage/profile.svg',
                  type: 'home',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
