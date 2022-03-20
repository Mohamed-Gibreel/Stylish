import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/modules/homepage/view/components/custom_app_bar.dart';
import 'package:stylish/modules/homepage/view/components/search_bar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingWidgetIcon: Icons.arrow_back_ios_new,
        leadingWidgetCb: () {
          Navigator.of(context).pop();
        },
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          const Hero(
            tag: 'search-bar',
            child: SearchBar(),
          ),
        ],
      ),
    );
  }
}
