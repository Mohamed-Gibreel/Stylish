import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/modules/landingpage/landingpage.dart';
import 'package:stylish/util/constants.dart';

class SettingsItem {
  SettingsItem(
    this.name,
    this.icon, {
    this.isRadio = false,
    this.value = false,
  });
  String name;
  bool value;
  bool isRadio;
  IconData icon;

  void toggleValue() {
    value = !value;
  }
}

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  SettingsItem email = SettingsItem('Email Support', Icons.email);
  SettingsItem faq = SettingsItem('FAQ', Icons.question_answer);
  SettingsItem privacy = SettingsItem('Privacy Statement', Icons.lock);
  SettingsItem notification =
      SettingsItem('Notification', CupertinoIcons.bell_solid, isRadio: true);
  SettingsItem update =
      SettingsItem('Update', CupertinoIcons.checkmark_seal, isRadio: true);

  Widget _settingsButton(SettingsItem item) {
    return Material(
      child: InkWell(
        onTap: item.isRadio
            ? () {
                item.toggleValue();
                if (mounted) setState(() {});
              }
            : () {},
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SizedBox(
            height: 65.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 42.w,
                      height: 42.h,
                      margin: EdgeInsets.only(right: 17.w),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF67952).withOpacity(.07),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Icon(
                        item.icon,
                        color: const Color(0xFFF67952),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.h),
                      child: Text(
                        item.name,
                        style: TextStyle(fontSize: 14.sp),
                      ),
                    ),
                  ],
                ),
                if (!item.isRadio)
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                  ),
                if (item.isRadio)
                  Switch.adaptive(
                    value: item.value,
                    onChanged: (_) {
                      item.toggleValue();
                      if (mounted) setState(() {});
                    },
                    activeColor: Constants.primaryColor,
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingWidgetIcon: Icons.arrow_back_ios_new,
        leadingWidgetCb: () => Navigator.of(context).pop(),
        title: Padding(
          padding: EdgeInsets.only(top: 5.h),
          child: const Text(
            'Settings',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 36.h,
          ),
          _settingsButton(email),
          // SizedBox(
          //   height: 25.h,
          // ),
          _settingsButton(faq),
          // SizedBox(
          //   height: 25.h,
          // ),
          _settingsButton(privacy),
          // SizedBox(
          //   height: 25.h,
          // ),
          _settingsButton(notification),
          // SizedBox(
          //   height: 25.h,
          // ),
          _settingsButton(update),
          // SizedBox(
          //   height: 25.h,
          // ),
        ],
      ),
    );
  }
}
