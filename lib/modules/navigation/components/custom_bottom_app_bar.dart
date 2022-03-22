import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/modules/navigation/cubit/navigation_cubit.dart';
import 'package:stylish/modules/navigation/cubit/navigation_enum.dart';
import 'package:stylish/modules/navigation/navigation.dart';
import 'package:stylish/util/constants.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85.h,
      padding: EdgeInsets.only(bottom: 25.h),
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
          child: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Constants.primaryColor,
            onTap: (index) {
              switch (index) {
                case 0:
                  BlocProvider.of<NavigationCubit>(context)
                      .setNavBarItem(NavigationItem.home);
                  break;
                case 1:
                  BlocProvider.of<NavigationCubit>(context)
                      .setNavBarItem(NavigationItem.favourite);
                  break;
                case 2:
                  BlocProvider.of<NavigationCubit>(context)
                      .setNavBarItem(NavigationItem.cart);
                  break;
                case 3:
                  BlocProvider.of<NavigationCubit>(context)
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
            tabs: [
              CustomBottomNavBarItem(
                icon: 'assets/homepage/profile.svg',
                active: state.navbarItem == NavigationItem.home,
              ),
              CustomBottomNavBarItem(
                icon: 'assets/homepage/heart-bottom-nav-bar.svg',
                active: state.navbarItem == NavigationItem.favourite,
              ),
              CustomBottomNavBarItem(
                icon: 'assets/homepage/buy.svg',
                active: state.navbarItem == NavigationItem.cart,
              ),
              CustomBottomNavBarItem(
                icon: 'assets/homepage/profile.svg',
                active: state.navbarItem == NavigationItem.profile,
              )
            ],
          ),
        ),
      ),
    );
  }
}
