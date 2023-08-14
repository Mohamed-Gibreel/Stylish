import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylish/modules/profile/views/custom_clip.dart';
import 'package:stylish/util/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  Widget _personalInfoField(String key, String value) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$key:',
              style: TextStyle(
                color: const Color(0xFF231F20).withOpacity(.5),
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
        SizedBox(height: 13.h)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            clipBehavior: Clip.none,
            children: [
              ClipPath(
                clipper: CustomClipPath(),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Constants.primaryColor.withOpacity(.1),
                        Theme.of(context).scaffoldBackgroundColor,
                      ],
                      stops: [
                        0.01,
                        0.65,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  width: double.infinity,
                  height: 175.h,
                ),
              ),
              Column(
                children: [
                  Container(
                    height: 135.h,
                    width: 135.w,
                    margin: EdgeInsets.symmetric(vertical: 22.h),
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      // boxShadow: <BoxShadow>[
                      // BoxShadow(
                      //   color: Colors.grey,
                      //   blurRadius: 1,
                      // ),
                      // ],
                      shape: BoxShape.circle,
                    ),
                    child: Material(
                      clipBehavior: Clip.hardEdge,
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        child: Image.asset('assets/profile/user.png'),
                      ),
                    ),
                  ),
                  Text(
                    'Mohamed Gibreel',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    'm.adilgibreel@gmail.com',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black.withOpacity(.5),
                    ),
                  ),
                  SizedBox(
                    height: 24.5.h,
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 106.w,
                      height: 117.h,
                      decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.grey.withOpacity(.1),
                            blurRadius: 10,
                          )
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          10.r,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 45.h,
                            width: 45.w,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(246, 121, 82, 0.07),
                              shape: BoxShape.circle,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 10.h,
                            ),
                            child: SvgPicture.asset(
                              'assets/profile/bag.svg',
                              width: 24.w,
                              height: 24.h,
                            ),
                          ),
                          Text(
                            'Progress Order',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '10+',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 106.w,
                      height: 117.h,
                      decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.grey.withOpacity(.1),
                            blurRadius: 10,
                          )
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          10.r,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 45.h,
                            width: 45.w,
                            decoration: BoxDecoration(
                              color: const Color(0xFF0EA2F6).withOpacity(.07),
                              shape: BoxShape.circle,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 10.h,
                            ),
                            child: SvgPicture.asset(
                              'assets/profile/ticket.svg',
                              width: 24.w,
                              height: 24.h,
                            ),
                          ),
                          Text(
                            'Promocodes',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '5',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 106.w,
                      height: 117.h,
                      decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.grey.withOpacity(.1),
                            blurRadius: 10,
                          )
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          10.r,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 45.h,
                            width: 45.w,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFC107).withOpacity(.07),
                              shape: BoxShape.circle,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 10.h,
                            ),
                            child: SvgPicture.asset(
                              'assets/profile/star.svg',
                              width: 24.w,
                              height: 24.h,
                            ),
                          ),
                          Text(
                            'Reviews',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '4.5K',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50.h),
                Text(
                  'Personal Information',
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 18.sp),
                ),
                SizedBox(height: 14.5.h),
                Container(
                  width: double.infinity,
                  // height: 194.h,
                  padding: EdgeInsets.fromLTRB(10.w, 11.h, 12.w, 0.h),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black.withOpacity(.1)),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Column(
                    children: [
                      _personalInfoField('Name', 'Mohamed Gibreel'),
                      _personalInfoField('Email', 'm.adilgibreel@gmail.com'),
                      _personalInfoField('Location', 'Abu Dhabi'),
                      _personalInfoField('Zip Code', '12345'),
                      _personalInfoField('Phone Number', '(+971) 50 530 3600'),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
