import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylish/modules/landingpage/landingpage.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  List<SideBarItemModel> sidebarItems = [
    SideBarItemModel(
      title: 'My favourites',
      icon: 'assets/homepage/heart.svg',
    ),
    SideBarItemModel(title: 'Wallet', icon: 'assets/homepage/wallet.svg'),
    SideBarItemModel(title: 'My orders', icon: 'assets/homepage/bag.svg'),
    SideBarItemModel(title: 'About us', icon: 'assets/homepage/document.svg'),
    SideBarItemModel(
      title: 'Privacy policy',
      icon: 'assets/homepage/lock.svg',
    ),
    SideBarItemModel(title: 'Settings', icon: 'assets/homepage/setting.svg'),
    SideBarItemModel(title: 'Log out', icon: 'assets/homepage/logout.svg'),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.w, top: 18.h),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 20.w),
                width: 71.w,
                height: 71.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Alex Nikiforov',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Text(
                    'Fashion designer',
                    style: TextStyle(
                      color: Colors.black.withOpacity(.5),
                      fontSize: 14.sp,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 65.h,
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: sidebarItems.length,
          itemBuilder: (context, index) => Wrap(
            children: [
              Padding(
                padding: index != sidebarItems.length - 1
                    ? EdgeInsets.only(bottom: 20.h)
                    : EdgeInsets.only(top: 45.h),
                child: SidebarItem(
                  item: sidebarItems[index],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 25.w, top: 40.h),
          child: SvgPicture.asset('assets/authentication/logo.svg'),
        )
      ],
    );
  }
}
