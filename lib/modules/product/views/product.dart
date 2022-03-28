import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/l10n/l10n.dart';
import 'package:stylish/modules/landingpage/landingpage.dart';
import 'package:stylish/modules/product/model/product_model.dart';
import 'package:stylish/util/constants.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Product?;
    final l10n = context.l10n;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        backgroundColor: Colors.transparent,
        leadingWidgetCb: () {
          Navigator.of(context).pop();
        },
        leadingWidgetIcon: Icons.arrow_back_ios_new,
        actionButtons: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: const Icon(
              Icons.heart_broken,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Color(int.parse(args?.bgColor ?? 'EFEFF2', radix: 16))
                  .withOpacity(args?.bgOpacity ?? .5),
              alignment: Alignment.topCenter,
              // color: Colors.red,
              child: SafeArea(
                child: Hero(
                  tag: args?.uid ?? 'shirt-1',
                  child: Image.asset(
                    args?.image ?? 'assets/products/shirt-1.png',
                    width: 272.w,
                    height: 300.h,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 365.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(45.r),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 145.w,
                            child: Text(
                              args?.name ?? 'Casual Henley Shirts',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Text(
                            '\$${args?.price}',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
                        style: TextStyle(
                          color: Colors.black.withOpacity(.5),
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Text(
                        'Colors',
                        style: TextStyle(
                          color: Colors.black.withOpacity(.5),
                          // fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 26.w,
                            height: 26.h,
                            margin: EdgeInsets.only(right: 9.w),
                            padding: EdgeInsets.symmetric(
                              horizontal: 2.w,
                              vertical: 2.h,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2.w,
                                color: Constants.primaryColor,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color(0xFFBEE8EA),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          Container(
                            width: 26.w,
                            height: 26.h,
                            margin: EdgeInsets.only(right: 9.w),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color(0xFF141B4A),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          Container(
                            width: 26.w,
                            height: 26.h,
                            margin: EdgeInsets.only(right: 9.w),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color(0xFFF4E5C3),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Constants.primaryColor,
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          height: 55.h,
                          width: 250.w,
                          child: Center(
                            child: Text(
                              l10n.addToCart,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
