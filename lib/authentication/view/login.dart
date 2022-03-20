import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish/authentication/authentication.dart';
import 'package:stylish/modules/homepage/view/homepage.dart';
import 'package:stylish/util/constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 55.h),
              SvgPicture.asset('assets/authentication/logo.svg'),
              SizedBox(
                height: 38.h,
              ),
              Text(
                'Log in',
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 35.h,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(8.w, 6.h, 0, 6.h),
                height: 60.h,
                decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey.withOpacity(.1),
                      blurRadius: 1,
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 48.w,
                      height: 45.h,
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 12.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Constants.primaryColor.withOpacity(.1),
                      ),
                      // SvgPicture.asset('assets/authentication/logo.svg'),
                      child: SvgPicture.asset(
                        'assets/authentication/message.svg',
                        width: 24.w,
                        height: 24.h,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Email',
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(8.w, 6.h, 0, 6.h),
                height: 60.h,
                decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey.withOpacity(.1),
                      blurRadius: 1,
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 48.w,
                      height: 45.h,
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 12.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Constants.primaryColor.withOpacity(.1),
                      ),
                      // SvgPicture.asset('assets/authentication/logo.svg'),
                      child: SvgPicture.asset(
                        'assets/authentication/lock.svg',
                        width: 24.w,
                        height: 24.h,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Password',
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forgot password?',
                  style:
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Material(
                color: Constants.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(133.r),
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 60.h,
                  child: InkWell(
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(133.r),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<Widget>(
                          builder: (context) => const Homepage(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Log in",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      height: 1,
                      color: Color.fromRGBO(35, 46, 36, 0.6),
                    ),
                  ),
                  SizedBox(
                    width: 25.w,
                  ),
                  Text(
                    'Or',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(
                    width: 25.w,
                  ),
                  const Expanded(
                    child: Divider(
                      height: 1,
                      color: Color.fromRGBO(35, 46, 36, 0.6),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 45.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 70.w,
                    height: 70.h,
                    decoration: BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.grey.withOpacity(.1),
                          blurRadius: 15,
                        )
                      ],
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/authentication/google.svg',
                      ),
                    ),
                  ),
                  Container(
                    width: 70.w,
                    height: 70.h,
                    decoration: BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.grey.withOpacity(.1),
                          blurRadius: 15,
                        )
                      ],
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/authentication/facebook.svg',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 55.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<Widget>(
                      builder: (context) => const RegisterScreen(),
                    ),
                  );
                },
                child: Text(
                  "Don't have an account? Sign up",
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
