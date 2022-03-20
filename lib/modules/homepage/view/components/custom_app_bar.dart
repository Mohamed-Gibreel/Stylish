import 'package:flutter/material.dart';
import 'package:stylish/modules/homepage/view/components/notification_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    this.shape,
    this.leadingWidgetIcon,
    this.leadingWidgetCb,
  }) : super(key: key);
  final ShapeBorder? shape;
  final VoidCallback? leadingWidgetCb;
  final IconData? leadingWidgetIcon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: shape,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      leadingWidth: 38.w,
      leading: GestureDetector(
        onTap: leadingWidgetCb,
        child: Icon(
          leadingWidgetIcon,
          color: Colors.black,
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.location_on_outlined,
            color: Colors.black,
            size: 16.h,
          ),
          SizedBox(
            width: 5.w,
          ),
          Text(
            'Abu Dhabi',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
            ),
          )
        ],
      ),
      actions: const [NotificationButton()],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
