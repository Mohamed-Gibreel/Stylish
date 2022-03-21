import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylish/l10n/l10n.dart';
import 'package:stylish/util/constants.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key, this.filterCb}) : super(key: key);
  final VoidCallback? filterCb;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Material(
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        width: double.infinity,
        height: 55.h,
        padding: EdgeInsets.only(left: 20.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                textAlign: TextAlign.left,
                cursorHeight: 15.h,
                decoration: InputDecoration(
                  hintStyle: TextStyle(height: 1.4.h),
                  focusColor: Colors.red,
                  prefixIcon: const Icon(Icons.search),
                  hintText: l10n.searchItems,
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            GestureDetector(
              onTap: filterCb,
              child: Container(
                width: 47.w,
                height: 43.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Constants.primaryColor,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/homepage/filter.svg',
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
