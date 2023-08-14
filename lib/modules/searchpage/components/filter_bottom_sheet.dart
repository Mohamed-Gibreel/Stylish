import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/l10n/l10n.dart';
import 'package:stylish/util/constants.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({Key? key}) : super(key: key);

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  RangeValues priceRange = const RangeValues(100, 200);
  RangeValues distanceRange = const RangeValues(500, 2000);
  String startNumber = '0';
  String endNumber = '500';

  String formatDistance(int distance) {
    var d = distance.toString();
    if (distance >= 1000) {
      final thousandsNumber = d.substring(0, d.length - 3);
      final hundredsNumber = d[d.length - 3];
      if (int.parse(hundredsNumber) != 0) {
        d = '$thousandsNumber.$hundredsNumber';
      } else {
        d = thousandsNumber;
      }
    }
    return d;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Container(
      height: 605.h,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 20.h),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30.r),
          topLeft: Radius.circular(30.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(l10n.clear),
                Text(
                  l10n.filters,
                  style: TextStyle(
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 30.h,
                    width: 30.w,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(118, 118, 128, 0.12),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.close),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 17.h,
          ),
          Divider(height: 0.h, color: Colors.black.withOpacity(.2)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 22.h,
                ),
                Text(
                  l10n.category,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Container(
                      height: 45.h,
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      margin: EdgeInsets.only(right: 9.w),
                      decoration: BoxDecoration(
                        color: Constants.primaryColor,
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Align(
                        child: Text(
                          l10n.newArrival,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 45.h,
                      padding: EdgeInsets.only(left: 10.w, right: 9.w),
                      margin: EdgeInsets.only(right: 8.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Align(
                        child: Text(
                          l10n.topTrending,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 45.h,
                      padding: EdgeInsets.symmetric(horizontal: 6.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Align(
                        child: Text(
                          l10n.featuredProducts,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 45.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      l10n.pricing,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                      ),
                    ),
                    const Text(r'$50-$200')
                  ],
                ),
                SizedBox(
                  height: 27.h,
                ),
                RangeSlider(
                  values: priceRange,
                  max: 500,
                  activeColor: Constants.primaryColor,
                  inactiveColor: Colors.grey.withOpacity(.2),
                  divisions: 10,
                  onChanged: (value) {
                    if (mounted) {
                      priceRange = value;
                      if (mounted) setState(() {});
                    }
                  },
                  labels: RangeLabels(
                    r'$' + priceRange.start.round().toString(),
                    r'$' + priceRange.end.round().toString(),
                  ),
                ),
                SizedBox(
                  height: 27.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      l10n.distance,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                      ),
                    ),
                    Text('$startNumber - $endNumber')
                  ],
                ),
                SizedBox(
                  height: 27.h,
                ),
                RangeSlider(
                  values: distanceRange,
                  max: 10000,
                  activeColor: Constants.primaryColor,
                  inactiveColor: Colors.grey.withOpacity(.2),
                  divisions: 20,
                  onChanged: (value) {
                    startNumber = formatDistance(
                      int.parse(value.start.toInt().toString()),
                    );
                    endNumber = formatDistance(
                      int.parse(value.end.toInt().toString()),
                    );
                    value.start.toInt() > 500
                        ? startNumber += ' Km'
                        : startNumber += ' m';
                    value.end.toInt() > 500
                        ? endNumber += ' Km'
                        : endNumber += ' m';
                    distanceRange = value;
                    if (mounted) setState(() {});
                  },
                  labels: RangeLabels(
                    startNumber,
                    endNumber,
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Center(
                  child: Container(
                    height: 55.h,
                    width: 255.w,
                    decoration: BoxDecoration(
                      color: Constants.primaryColor,
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 80.w),
                      child: Center(
                        child: Text(
                          l10n.applyFilter,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
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
        ],
      ),
    );
  }
}
