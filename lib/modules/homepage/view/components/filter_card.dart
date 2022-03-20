import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FilterCard extends StatelessWidget {
  const FilterCard({
    Key? key,
    required this.filterImage,
    required this.filterText,
  }) : super(key: key);
  final String filterText;
  final String filterImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.h,
      width: 71.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: Colors.black.withOpacity(.05),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            filterImage,
            height: 27.h,
            fit: BoxFit.fitHeight,
          ),
          SizedBox(
            height: 7.h,
          ),
          Text(filterText)
        ],
      ),
    );
  }
}
