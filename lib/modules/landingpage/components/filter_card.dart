import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FilterCard extends StatelessWidget {
  const FilterCard({
    Key? key,
    required this.filterImage,
    required this.filterText,
    required this.isSelected,
  }) : super(key: key);
  final String filterText;
  final String filterImage;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 75.h,
      width: 71.w,
      decoration: BoxDecoration(
        color: isSelected
            ? Colors.white
            : Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(isSelected ? .1 : 0),
            blurRadius: 5,
          )
        ],
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
