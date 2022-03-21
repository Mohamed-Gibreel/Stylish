import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/modules/landingpage/landingpage.dart';
import 'package:stylish/modules/searchpage/searchpage.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on_outlined,
              color: Colors.black,
              size: 16.h,
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              'Abu Dhabi',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
              ),
            )
          ],
        ),
        leadingWidgetIcon: Icons.arrow_back_ios_new,
        leadingWidgetCb: () {
          Navigator.of(context).pop();
        },
        actionButtons: const [NotificationButton()],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Hero(
            tag: 'search-bar',
            child: SearchBar(
              filterCb: () {
                showModalBottomSheet<FilterBottomSheet>(
                  isScrollControlled: true,
                  context: context,
                  barrierColor: Colors.black.withOpacity(.7),
                  backgroundColor: Colors.transparent,
                  builder: (ctx) => const FilterBottomSheet(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
