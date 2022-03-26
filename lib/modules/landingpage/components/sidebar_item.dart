import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylish/modules/landingpage/models/sidebar_item_model.dart';

import 'package:stylish/util/constants.dart';

class SidebarItem extends StatelessWidget {
  const SidebarItem({
    Key? key,
    required this.item,
  }) : super(key: key);
  final SideBarItemModel item;

  void _navigateToPage(SideBarItemModel activeItem, BuildContext context) {
    switch (activeItem.title) {
      case 'Settings':
        Navigator.of(context).pushNamed('/settingsPage');
        break;
      case 'My orders':
        Navigator.of(context).pushNamed('/myOrdersPage');
        break;
      case 'My favourites':
        Navigator.of(context).pushNamed('/favouritesPage');
        break;
      case 'Wallet':
        Navigator.of(context).pushNamed('/myWalletPage');
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToPage(item, context),
      child: Container(
        padding: EdgeInsets.only(left: 20.w, right: 45.w),
        height: 40.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(22.r),
            topRight: Radius.circular(22.r),
          ),
          color: Colors.transparent,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 27.w,
              height: 24.h,
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.w),
              margin: EdgeInsets.only(right: 15.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Constants.primaryColor.withOpacity(.1),
              ),
              child: SvgPicture.asset(item.icon),
            ),
            Text(
              item.title,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
            ),
          ],
        ),
      ),
    );
  }
}
