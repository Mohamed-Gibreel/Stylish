import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish/util/constants.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  Color getCheckColor(Set<MaterialState> states) {
    const interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Constants.primaryColor;
    }
    return Constants.primaryColor;
  }

  bool termsChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                  'Sign Up',
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
                          'assets/authentication/profile.svg',
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
                            hintText: 'Name',
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.5.h,
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
                  height: 11.h,
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
                  height: 17.h,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    children: [
                      Container(
                        constraints: BoxConstraints(maxHeight: 18.h),
                        child: Checkbox(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          fillColor:
                              MaterialStateColor.resolveWith(getCheckColor),
                          value: termsChecked,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.r),
                          ),
                          onChanged: (value) {
                            if (mounted) setState(() {});
                            termsChecked = value ?? false;
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          termsChecked = !termsChecked;
                          if (mounted) setState(() {});
                        },
                        child: Text(
                          'I accept all the Terms & Conditions',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  width: double.infinity,
                  height: 60.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(133.r),
                    color: Constants.primaryColor,
                  ),
                  child: Center(
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.5.h,
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
                        fontSize: 14.sp,
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
                  height: 24.5.h,
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
                            blurRadius: 2,
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
                            blurRadius: 2,
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
                  height: 27.5.h,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Already have an account? Log in',
                    style: TextStyle(
                      fontSize: 14.sp,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
