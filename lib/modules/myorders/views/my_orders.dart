import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/modules/landingpage/landingpage.dart';
import 'package:stylish/util/constants.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int activeIndex = 0;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    // _tabController.addListener(() {
    //   activeIndex = _tabController.index;
    //   if (mounted) setState(() {});
    // });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _completedItem(String name, String date, String icon, int price) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 92.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 10.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 84.w,
                    height: 73.h,
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.w,
                      vertical: 5.h,
                    ),
                    margin: EdgeInsets.only(right: 20.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: const Color.fromRGBO(62, 66, 41, 0.1),
                    ),
                    child: Image.asset(
                      icon,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          color: Colors.black.withOpacity(.5),
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Text(
                        r'$' + price.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                date,
                style: TextStyle(
                  color: Colors.black.withOpacity(.5),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 13.h,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingWidgetIcon: Icons.arrow_back_ios_new,
        leadingWidgetCb: () {
          Navigator.of(context).pop();
        },
        title: Padding(
          padding: EdgeInsets.only(top: 5.h),
          child: const Text(
            'My Orders',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: TabBar(
              controller: _tabController,
              indicatorColor: Constants.primaryColor,
              indicatorWeight: 3,
              labelColor: Constants.primaryColor,
              unselectedLabelColor: Colors.black,
              tabs: [
                Container(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: const Text(
                    'Completed',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: const Text(
                    'Cancelled',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      _completedItem(
                        'Henley Shirts',
                        'Today',
                        'assets/products/shirt-3.png',
                        250,
                      ),
                      _completedItem(
                        'Causal Shirts',
                        '20 Jan’2021',
                        'assets/products/shirt-2.png',
                        145,
                      ),
                      _completedItem(
                        'Casual Nolin',
                        '20 Mar’2021',
                        'assets/products/shirt-4.png',
                        225,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: const Text('hehe'),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          const Text('My orders screen'),
        ],
      ),
    );
  }
}
