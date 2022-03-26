import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/l10n/l10n.dart';
import 'package:stylish/modules/landingpage/landingpage.dart';
import 'package:stylish/util/constants.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  Color getCheckColor(Set<MaterialState> states) {
    return Constants.primaryColor;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: CustomAppBar(
        leadingWidgetIcon: Icons.arrow_back_ios_new,
        leadingWidgetCb: () {
          Navigator.of(context).pop();
        },
        title: Text(
          l10n.checkout,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(21.w, 42.h, 21.w, 0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.deliveryAddress,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Container(
              height: 86.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey.withOpacity(.1),
                    blurRadius: 5,
                  )
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Transform.scale(
                        scale: 1.5,
                        child: Checkbox(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          fillColor:
                              MaterialStateColor.resolveWith(getCheckColor),
                          value: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          onChanged: (_) {},
                        ),
                      ),
                      SizedBox(
                        width: 23.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Home'),
                          SizedBox(
                            height: 3.h,
                          ),
                          const Text('(342) 4522019'),
                          SizedBox(
                            height: 3.h,
                          ),
                          const Text('220 New York'),
                        ],
                      )
                    ],
                  ),
                  const Icon(Icons.edit)
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              height: 86.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black.withOpacity(.05),
                ),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Transform.scale(
                        scale: 1.5,
                        child: Checkbox(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          fillColor:
                              MaterialStateColor.resolveWith(getCheckColor),
                          value: false,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          onChanged: (_) {},
                        ),
                      ),
                      SizedBox(
                        width: 23.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Home'),
                          SizedBox(
                            height: 3.h,
                          ),
                          const Text('(342) 4522019'),
                          SizedBox(
                            height: 3.h,
                          ),
                          const Text('220 New York'),
                        ],
                      )
                    ],
                  ),
                  const Icon(Icons.edit)
                ],
              ),
            ),
            SizedBox(
              height: 36.h,
            ),
            Text(
              l10n.billingInformation,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
              height: 134.h,
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 111.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              l10n.deliveryFee,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.black.withOpacity(.5),
                              ),
                            ),
                            const Text(
                              ':',
                            ),
                          ],
                        ),
                      ),
                      Text(
                        r'$50',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 111.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              l10n.subTotal,
                              style: TextStyle(
                                color: Colors.black.withOpacity(.5),
                              ),
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            const Text(
                              ':',
                            ),
                          ],
                        ),
                      ),
                      Text(
                        r'$50',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Divider(
                    height: 0.h,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 111.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              l10n.total,
                              style: TextStyle(
                                color: Colors.black.withOpacity(.5),
                              ),
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            const Text(
                              ':',
                            ),
                          ],
                        ),
                      ),
                      Text(
                        r'$50',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 35.h),
            Text(
              l10n.paymentMethod,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 24.h),
            Row(
              children: [
                Container(
                  width: 70.w,
                  height: 55.h,
                  margin: EdgeInsets.only(right: 5.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/checkout/applepay.png',
                      width: 43.w,
                    ),
                  ),
                ),
                Container(
                  width: 70.w,
                  height: 55.h,
                  margin: EdgeInsets.only(right: 5.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/checkout/visa.png',
                      width: 43.w,
                    ),
                  ),
                ),
                Container(
                  width: 70.w,
                  height: 55.h,
                  margin: EdgeInsets.only(right: 5.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/checkout/mastercard.png',
                      width: 43.w,
                    ),
                  ),
                ),
                Container(
                  width: 70.w,
                  height: 55.h,
                  margin: EdgeInsets.only(right: 5.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/checkout/paypal.png',
                      width: 43.w,
                      height: 25.h,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  '/completedOrder',
                  (route) => false,
                );
              },
              child: Center(
                child: Container(
                  width: 230.w,
                  height: 55.h,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor,
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  child: Center(
                    child: Text(
                      l10n.swipeForPayment,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
