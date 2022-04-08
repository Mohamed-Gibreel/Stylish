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
    const SideBarItemModel(
      title: 'My favourites',
      icon: 'assets/homepage/heart.svg',
    ),
    const SideBarItemModel(title: 'Wallet', icon: 'assets/homepage/wallet.svg'),
    const SideBarItemModel(title: 'My orders', icon: 'assets/homepage/bag.svg'),
    const SideBarItemModel(
      title: 'About us',
      icon: 'assets/homepage/document.svg',
    ),
    const SideBarItemModel(
      title: 'Privacy policy',
      icon: 'assets/homepage/lock.svg',
    ),
    const SideBarItemModel(
      title: 'Settings',
      icon: 'assets/homepage/setting.svg',
    ),
    const SideBarItemModel(
      title: 'Log out',
      icon: 'assets/homepage/logout.svg',
    ),
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
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey.withOpacity(.1),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Material(
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    onTap: () {},
                    child: Image.asset('assets/profile/user.png'),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mohamed Gibreel',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Text(
                    'Software engineer',
                    style: TextStyle(
                      color: Colors.black.withOpacity(.5),
                      fontSize: 14.sp,
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
