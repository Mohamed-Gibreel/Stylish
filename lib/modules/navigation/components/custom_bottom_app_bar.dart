import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/modules/navigation/cubit/navigation_cubit.dart';
import 'package:stylish/modules/navigation/cubit/navigation_enum.dart';
import 'package:stylish/modules/navigation/navigation.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                BlocProvider.of<NavigationCubit>(context)
                    .setNavBarItem(NavigationItem.home);
              },
              child: CustomBottomNavBarItem(
                icon: 'assets/homepage/profile.svg',
                active: state.navbarItem == NavigationItem.home,
              ),
            ),
            GestureDetector(
              onTap: () {
                BlocProvider.of<NavigationCubit>(context)
                    .setNavBarItem(NavigationItem.favourite);
              },
              child: CustomBottomNavBarItem(
                icon: 'assets/homepage/heart-bottom-nav-bar.svg',
                active: state.navbarItem == NavigationItem.favourite,
              ),
            ),
            GestureDetector(
              onTap: () {
                BlocProvider.of<NavigationCubit>(context)
                    .setNavBarItem(NavigationItem.cart);
              },
              child: CustomBottomNavBarItem(
                icon: 'assets/homepage/buy.svg',
                active: state.navbarItem == NavigationItem.cart,
              ),
            ),
            GestureDetector(
              onTap: () {
                BlocProvider.of<NavigationCubit>(context)
                    .setNavBarItem(NavigationItem.profile);
              },
              child: CustomBottomNavBarItem(
                icon: 'assets/homepage/profile.svg',
                active: state.navbarItem == NavigationItem.profile,
              ),
            )
          ],
        ),
      ),
    );
  }
}
